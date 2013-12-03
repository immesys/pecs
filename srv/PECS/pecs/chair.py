
import socket
from threading import Thread
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

def get_heat_stream(uid):
    global shared
    dev = db.devices.find_one({'uid':uid})
    if dev is None:
        #make a new one
        dev = {'heat_stream_id':str(uuid.uuid1()), 'fan_stream_id':str(uuid.uuid1()), 'contact_stream_id':str(uuid.uuid1()), 'uid':uid}
        db.devices.save(dev)
        
    params = shared.copy()
    params.update({'instName':uid, 'uuid':dev['heat_stream_id'], 'instFullName':'PECS chair #'+uid, 'sensorName':"heating", 'unitofMeasure':'points'})
    rv = Ssstream(**params)
    return rv

def get_fan_stream(uid):
    global shared
    dev = db.devices.find_one({'uid':uid})
    if dev is None:
        #make a new one
        dev = {'heat_stream_id':str(uuid.uuid1()), 'fan_stream_id':str(uuid.uuid1()), 'contact_stream_id':str(uuid.uuid1()), 'uid':uid}
        db.devices.save(dev)
        
    params = shared.copy()
    params.update({'instName':uid, 'uuid':dev['fan_stream_id'], 'instFullName':'PECS chair #'+uid, 'sensorName':'fans', 'unitofMeasure':'points'})
    rv = Ssstream(**params)
    return rv

def get_occupancy_stream(uid):
    global shared
    dev = db.devices.find_one({'uid':uid})
    if dev is None:
        #make a new one
        dev = {'heat_stream_id':str(uuid.uuid1()), 'fan_stream_id':str(uuid.uuid1()), 'contact_stream_id':str(uuid.uuid1()), 'uid':uid}
        db.devices.save(dev)
        
    params = shared.copy()
    params.update({'instName':uid, 'uuid':dev['contact_stream_id'], 'instFullName':'PECS chair #'+uid,'sensorName':'occupancy', 'unitofMeasure':'points'})
    rv = Ssstream(**params)
    return rv
            
def launch_udp_server():
    def t():
        sock = socket.socket(socket.AF_INET6, socket.SOCK_DGRAM)
        sock.bind(("::", 7005))
        while True:
            data, addr = sock.recvfrom(1024)
            fan, heat, occupancy, uid = struct.unpack_from("<BBBL", data)
            uid = str(uid)
            doc = {"uid":uid, "addr":addr, "fan":fan, "heat":heat, "sw":occupancy, "when":time.time()}
            setchair(uid, fan, heat)
            db.packets.save(doc)
            
            heats = get_heat_stream(uid)
            heats.set_readings([(int(time.time()*1000), heat)])
            assert heats.publish()
            
            fans = get_fan_stream(uid)
            fans.set_readings([(int(time.time()*1000), fan)])
            assert fans.publish()
            
            occupancys = get_occupancy_stream(uid)
            occupancys.set_readings([(int(time.time()*1000), occupancy)])
            assert occupancys.publish()
            
            print "Got data:",(", ".join(["0x{:02x}".format(ord(d)) for d in data]))
            print "From: ",addr
            print "Doc: ",doc
            #process
    tr = Thread(target=t)
    tr.start()
    
def getchair(code):
    l = db.codes.find_one({"code":code})
    if l is None:
        return None
    if l["expire"] < time.time():
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
        #No biggie
        c = {"uid":uid}
    c["fan"] = fan
    c["heat"] = heat
    db.chairs.save(c)
    
def synchair(uid, chair=None):
    if chair == None:
        chair = db.chairs.find_one({"uid":uid})
    if chair is None:
        return False
    msg = chr(0x15) + chr(chair["fan"]) + chr(chair["heat"])
    
    curs = db.packets.find({'uid':uid}).sort([("when", pymongo.DESCENDING)])
    if curs.count() == 0:
        return False
    destaddr = curs[0]["addr"][0]
    sock = socket.socket(socket.AF_INET6, socket.SOCK_DGRAM)
    print "destaddr is",repr(destaddr)
    sock.sendto(msg, (destaddr, 7001))
    return True
          
def log_control_heartbeat(code, command, value, worked):
    pass

def get_ages():
    ids = list(db.packets.distinct("uid"))
    rv = []
    for i in ids:
        doc = db.packets.find({'uid':uid}).sort([("when", pymongo.DESCENDING)])[0]
        rv += [(i, time.time()-doc["when"])]
    return rv
    
def sendmsg(uid, msg):
    chair = getchair(code)
    if chair is None:
        log_control_heartbeat(code, command, value, False)
        return {"error":"not found"}
    log_control_heartbeat(code, command, value, True)
    uid = chair["uid"]
    print "Searching for uid: ",uid
    curs = db.packets.find({'uid':uid}).sort([("when", pymongo.DESCENDING)])
    if curs.count() == 0:
        return {"error":"not found"}
    destaddr = curs[0]["addr"][0]
    sock = socket.socket(socket.AF_INET6, socket.SOCK_DGRAM)
    cmd = r"" + chr(command)+chr(value)
    print "cmd is",cmd
    print "destaddr is",repr(destaddr)
    sock.sendto(cmd, (destaddr, 7001))
    return {"success":"True","address":destaddr}
    
    
def add_code(uid, code, expire):
    db.codes.save({"code":code, "created":time.time, "expire":expire, "uid":uid})
    
