from pyramid.view import view_config
import pymongo
import socket
client = pymongo.MongoClient()
db = client.pecs
import time

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
    synchair(ch["uid"])
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
    
def synchair(uid):
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
    
@view_config(route_name='home', renderer='pecs:templates/home.mako')
def my_view(request):
    return {'project': 'PECS'}
    
    
@view_config(route_name='controlpanel', renderer='pecs:templates/controlpanel.mako')
def controlpanel(request):
    code = int(request.matchdict['code'],16)
    chairobj = getchair(code)
    if chairobj == None:
        return {"error":"Chair code invalid"}
    else:
        return {"error":"none", "chair":chairobj, "code":code}
    
@view_config(route_name='apply_fan', renderer='json')
def apply_fan(request):
    code = int(request.matchdict['code'],16)
    if "v" in request.POST:
        v = request.POST.getone('v')
    elif "v" in request.GET:
        v = request.GET.getone('v')
    else:
        return {'error':'no value'}
    return setchair_ex(code, v, None)
 
    #return sendmsg(int(request.matchdict['code']), 0x10, int(v)) 
    
@view_config(route_name='apply_heat', renderer='json')
def apply_heat(request):
    code = int(request.matchdict['code'],16)
    if "v" in request.POST:
        v = request.POST.getone('v')
    elif "v" in request.GET:
        v = request.GET.getone('v')
    else:
        return {'error':'no value'}
    return setchair_ex(code, None, v)
    #return sendmsg(request.matchdict['code'], 0x11, int(v)) 
    
    
