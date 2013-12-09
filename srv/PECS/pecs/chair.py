
import socket
from threading import Thread, Condition
import struct
import pymongo
import uuid
import time
from ssmap import Ssstream
client = pymongo.MongoClient()
db = client.pecs

subkey="UnSkoHexOvrlU9OPDPheQ5uVhMY5M5lfpE14"
url="http://pecs.cal-sdb.org/backend"
shared = {'srcFullName':"PECS Chair deployment", 'url':url, 'subkey':subkey}

def get_device(uid):
    dev = db.devices.find_one({'uid':uid})
    if dev is None:
        dev = {'heat_stream_id':str(uuid.uuid1()),
               'temp_stream_id':str(uuid.uuid1()),
               'rh_stream_id':str(uuid.uuid1()),
               'fan_stream_id':str(uuid.uuid1()), 
               'contact_stream_id':str(uuid.uuid1()), 
               'uid':uid}
        db.devices.save(dev)
    if "temp_stream_id" not in dev:
        dev["temp_stream_id"] = str(uuid.uuid1())
        db.devices.save(dev)
    if "rh_stream_id" not in dev:
        dev["rh_stream_id"] = str(uuid.uuid1())
        db.devices.save(dev)
    return dev

def get_sensors(uid):
    curs = db.packets.find({'uid':uid}).sort([("when", pymongo.DESCENDING)])
    if curs.count() == 0:
        return {"tempf":"N/A", "tempc":"N/A", "humidity":"N/A"}
    pack = curs[0]
    f = 9.0/5.0 * pack["ctemp"] + 32
    return {"tempf":"{:.2f}".format(f),"tempc":"{:.2f}".format(pack["ctemp"]), "humidity":"{:.2f}".format(pack["crh"])}
        
def get_heat_stream(uid):
    dev = get_device(uid)
    params = shared.copy()
    uid = str(uid)
    params.update({'instName':uid, 'uuid':dev['heat_stream_id'], 'instFullName':'PECS chair #'+uid, 'sensorName':"heating", 'unitofMeasure':'%'})
    rv = Ssstream(**params)
    return rv

def get_fan_stream(uid):
    global shared
    dev = get_device(uid)
    params = shared.copy()
    uid = str(uid)
    params.update({'instName':uid, 'uuid':dev['fan_stream_id'], 'instFullName':'PECS chair #'+uid, 'sensorName':'fans', 'unitofMeasure':'%'})
    rv = Ssstream(**params)
    return rv

def get_occupancy_stream(uid):
    global shared
    dev = get_device(uid)
    params = shared.copy()
    uid = str(uid)
    params.update({'instName':uid, 'uuid':dev['contact_stream_id'], 'instFullName':'PECS chair #'+uid,'sensorName':'occupancy', 'unitofMeasure':'%'})
    rv = Ssstream(**params)
    return rv

def get_temp_stream(uid):
    global shared
    dev = get_device(uid)
    params = shared.copy()
    uid = str(uid)
    params.update({'instName':uid, 'uuid':dev['temp_stream_id'], 'instFullName':'PECS chair #'+uid,'sensorName':'temperature', 'unitofMeasure':'C'})
    rv = Ssstream(**params)
    return rv
    
def get_rh_stream(uid):
    global shared
    dev = get_device(uid)
    params = shared.copy()
    uid = str(uid)
    params.update({'instName':uid, 'uuid':dev['rh_stream_id'], 'instFullName':'PECS chair #'+uid,'sensorName':'relative humidity', 'unitofMeasure':'%'})
    rv = Ssstream(**params)
    return rv 
       
def convert_rh(raw):
    #These coefficients are for the 12 bit reading, from the datasheet
    c1 = -2.0468
    c2 = 0.0367
    c3 = -1.5955E-6
    rv = c1 + c2*raw + c3*(raw**2)
    if (rv > 99): rv = 100
    return rv
    
def convert_temp(raw):
    d1_35v = -39.7
    d1_30v = -39.6
    d1_33v = -39.66
    d2_14b = 0.01
    rv = d1_33v + d2_14b*raw
    return rv
                
def launch_udp_server():
    def t():
        sock = socket.socket(socket.AF_INET6, socket.SOCK_DGRAM)
        sock.bind(("::", 7005))
        while True:
            data, addr = sock.recvfrom(1024)
            fan, heat, occupancy, uid, fansrc, heatsrc, rh, temp = struct.unpack_from("<BBBLBBHH", data)
            #cloud is 1, screen is 2
            uid = int(uid)
            if rh != 0:
                real_rh = convert_rh(rh)
            else:
                real_rh = None
            if temp != 0:
                real_temp = convert_temp(temp)
            else:
                real_temp = None
            doc = {"uid":uid, "addr":addr, "fan":fan, "heat":heat, "sw":occupancy, "when":time.time(), 
                   "fansrc":fansrc, "heatsrc":heatsrc, "rh":rh, "temp":temp, "crh":real_rh, "ctemp":real_temp}
            ch = db.chairs.find_one({"uid":uid})
            needsync = False
            if ch != None:
                if ch["fan"] != fan and fansrc == 1:
                    #The chair thinks it was last set from the cloud but the settings are wrong,
                    #so tell it again
                    print "Received fan doesn't match expectation"
                    needsync = True
                if ch["heat"] != heat and heatsrc == 1:
                    print "Received heat doesn't match expectation"
                    needsync = True
                if fansrc == 2:
                    ch["fan"] = fan
                if heatsrc == 2:
                    ch["heat"] = heat
                if heatsrc == 2 or fansrc == 2:
                    setchair(uid, fan, heat)
                if needsync:
                    synchair(uid, ch)
            else:
                setchair(uid, fan, heat)
            db.packets.save(doc)
            
            heats = get_heat_stream(uid)
            heats.set_readings([(int(time.time()*1000), heat)])
            heats.publish()
            
            fans = get_fan_stream(uid)
            fans.set_readings([(int(time.time()*1000), fan*(100./7))])
            fans.publish()
            
            occupancys = get_occupancy_stream(uid)
            occupancys.set_readings([(int(time.time()*1000), occupancy*100)])
            occupancys.publish()
            
            if rh != 0:
                rhs = get_rh_stream(uid)
                rhs.set_readings([(int(time.time()*1000), real_rh)])
                rhs.publish()
                
            if temp != 0:
                temps = get_temp_stream(uid)
                temps.set_readings([(int(time.time()*1000), real_temp)])
                temps.publish()
            
            print "Got data:",(", ".join(["0x{:02x}".format(ord(d)) for d in data]))
            print "From: ",addr
            print "Doc: ",doc
            #process
    tr = Thread(target=t)
    tr.start()
    
def getchair(code):
    l = db.codes.find_one({"code":code})
    if l is None:
        print "No code found in DB: ",code
        return None
    if l["expire"] < time.time():
        print "Code expired: ",code
        return None
    ch = db.chairs.find_one({"uid":l["uid"]})
    return ch

def setchair_ex(code, fan, heat):
    ch = getchair(code)
    
    if ch is None:
        return {"error":"not found"}
    if fan is None:
        fan = ch["fan"]
    if heat is None:
        heat = ch["heat"]
    fan = int(fan)
    heat = int(heat)
    print "params: ",ch,fan,heat
    ch["fan"] = fan
    ch["heat"] = heat
    #print "setting chair %d to %d, %d" %(ch["uid"],fan,heat)
    setchair(ch["uid"], fan, heat)
    synchair(ch["uid"], ch)
    return {"error":"none"}
        
def setchair(uid, fan, heat):
    uid = int(uid)
    fan = int(fan)
    heat = int(heat)
    if fan < 0: fan = 0
    if fan > 255: fan = 255
    if heat < 0: heat = 0
    if heat > 255: heat = 255
    
    c = db.chairs.find_one({"uid":uid})
    if c == None:
        print "Chair not found for uid: ",uid
        #No biggie
        c = {"uid":uid}
    c["fan"] = fan
    c["heat"] = heat
    db.chairs.save(c)

def synchair_aggregated(uid, chair=None):
    print "sc agg inv c=",chair
    c = db.codes.find({"uid":uid}).sort("expire", pymongo.DESCENDING)
    if c.count() == 0:
        print "No codes for chair!"
        return
    code = c[0]["code"]
    enqueue_heat(code, chair["heat"])
    enqueue_fan(code, chair["fan"])

def synchair(uid, chair=None):
    print "synchair invoked c=",chair
    if chair == None:
        chair = db.chairs.find_one({"uid":uid})
    if chair is None:
        print "Synchair: chair not found"
        return False
    msg = chr(0x15) + chr(chair["fan"]) + chr(chair["heat"])
    
    curs = db.packets.find({'uid':uid}).sort([("when", pymongo.DESCENDING)])
    if curs.count() == 0:
        print "Synchair, packet not found"
        return False
    destaddr = curs[0]["addr"][0]
    sock = socket.socket(socket.AF_INET6, socket.SOCK_DGRAM)
    print "destaddr is",repr(destaddr)
    print "msg is",[hex(ord(c)) for c in msg]
    rv = sock.sendto(msg, (destaddr, 7001))
    print "rv is:",rv
    return True
          
def log_control_heartbeat(code, command, value, worked):
    pass

def get_ages():
    ids = list(db.packets.distinct("uid"))
    rv = []
    for i in ids:
        doc = db.packets.find({'uid':i}).sort([("when", pymongo.DESCENDING)])[0]
        rv += [(i, time.time()-doc["when"])]
    return rv
    
def sendmsg(uid, msg):
    print "Searching for uid: ",uid
    curs = db.packets.find({'uid':uid}).sort([("when", pymongo.DESCENDING)])
    if curs.count() == 0:
        return {"error":"not found"}
    destaddr = curs[0]["addr"][0]
    sock = socket.socket(socket.AF_INET6, socket.SOCK_DGRAM)
    print "destaddr is",repr(destaddr)
    print "msg is",[hex(ord(c)) for c in msg]
    rv = sock.sendto(msg, (destaddr, 7001))
    print "rv was: ",rv
    return {"success":"True","address":destaddr}
    
    
def add_code(uid, code, expire):
    db.codes.save({"code":code, "created":time.time, "expire":expire, "uid":uid})


cv = Condition()
fandict = {}
heatdict = {}
def enqueue_fan(code, val):
    print "Enqueue F:",code,val
    cv.acquire()
    if code in fandict:
        fandict[code][1] = val
	fandict[code][0] = time.time() + 2
    else:
        #setchair_ex(code, val, None)
        fandict[code] = [time.time() + 2, val]
        cv.notify()
    cv.release()
    
def enqueue_heat(code, val):
    print "Enqueue H:",code,val
    cv.acquire()
    if code in heatdict:
        heatdict[code][1] = val
	heatdict[code][0] = time.time() + 2
    else:
        #setchair_ex(code, None, val)
        heatdict[code] = [time.time() + 2, val]
        cv.notify()
    cv.release()
        
def start_dict_thread():
    def t():
        while True:
            mint = time.time() + 10
            cv.acquire()
            fl = fandict.keys()
            for d in fl: 
                if fandict[d][0] < time.time():
                    print "sending fan: ",d,fandict[d][1]
                    setchair_ex(d, fandict[d][1], None)
                    del fandict[d]
                elif fandict[d][0] < mint:
                    mint = fandict[d][0]
            hl = heatdict.keys()
            for d in hl: 
                if heatdict[d][0] < time.time():
                    print "sending heat: ",d,heatdict[d][1]
                    setchair_ex(d, None, heatdict[d][1])
                    del heatdict[d]
                elif heatdict[d][0] < mint:
                    mint = heatdict[d][0]
            if mint - time.time() > 5:
                cv.wait(2)
                cv.release()
            else:
                cv.wait(mint-time.time())
                cv.release()
    tr = Thread(target=t)
    tr.start() 
      
