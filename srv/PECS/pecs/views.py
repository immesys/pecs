from pyramid.view import view_config
import pymongo
import socket
client = pymongo.MongoClient()
db = client.pecs

def sendmsg(uid, command, value):
    uid = str(uid)
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
    
    
@view_config(route_name='homeuid', renderer='pecs:templates/home.mako')
def home_uid(request):
    return {'project': 'PECS', 'uid':request.matchdict['uid']}
    
@view_config(route_name='apply_fan', renderer='json')
def apply_fan(request):
    if "v" in request.POST:
        v = request.POST.getone('v')
    elif "v" in request.GET:
        v = request.GET.getone('v')
    else:
        return {'error':'no value'}
    return sendmsg(int(request.matchdict['uid']), 0x10, int(v)) 
    
@view_config(route_name='apply_heat', renderer='json')
def apply_heat(request):
    if "v" in request.POST:
        v = request.POST.getone('v')
    elif "v" in request.GET:
        v = request.GET.getone('v')
    else:
        return {'error':'no value'}
    return sendmsg(int(request.matchdict['uid']), 0x11, int(v)) 
    
    
