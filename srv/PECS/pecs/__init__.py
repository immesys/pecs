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
from chair import launch_udp_server
  

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
    config.add_route('ages','/debug/ages')
    config.scan()
    return config.make_wsgi_app()
    
    

