from pyramid.view import view_config
import pymongo
import socket
client = pymongo.MongoClient()
db = client.pecs
import time

from chair import *
    
@view_config(route_name='home', renderer='pecs:templates/home.mako')
def my_view(request):
    return {'project': 'PECS'}
    

@view_config(route_name="contact", renderer="pecs:templates/contact.mako")
def contact(request):
    return {}

@view_config(route_name="about", renderer="pecs:templates/about.mako")
def about(request):
    return {}
        
@view_config(route_name='controlpanel', renderer='pecs:templates/controlpanel.mako')
def controlpanel(request):
    code = int(request.matchdict['code'],16)
    chairobj = getchair(code)
    if chairobj == None:
        return {"error":"Chair code invalid"}
    else:
        return {"error":"none", "chair":chairobj, "code":"{:08X}".format(code)}
    
@view_config(route_name='apply_fan', renderer='json')
def apply_fan(request):
    code = int(request.matchdict['code'],16)
    if "v" in request.POST:
        v = request.POST.getone('v')
    elif "v" in request.GET:
        v = request.GET.getone('v')
    else:
        return {'error':'no value'}
    #todo check code first
#    enqueue_fan(code, v)
#    return {}
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
#    enqueue_heat(code, v)
#    return {}
    return setchair_ex(code, None, v)
    #return sendmsg(request.matchdict['code'], 0x11, int(v)) 
    
@view_config(route_name='ages', renderer='json')
def ages(request):
    return get_ages()
    
    
