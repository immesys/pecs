from pyramid.config import Configurator
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
            
            print "Got data:",data
            print "From: ",addr
            print "Doc: ",doc
            #process
    tr = Thread(target=t)
    tr.start()    

def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
        We also fork our UDP server that listens for chair
        updates
    """
    launch_udp_server()
    config = Configurator(settings=settings)
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.add_route('home', '/')
    config.add_route('controlpanel', '/{code:[0-9A-F]{8}}')
    config.add_route('apply_fan', '/{code:[0-9A-F]{8}}/fan')
    config.add_route('apply_heat','/{code:[0-9A-F]{8}}/heat')
    config.scan()
    return config.make_wsgi_app()
    
    

