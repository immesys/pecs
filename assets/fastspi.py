
#FIO 0 = MOSI
#FIO 1 = MISO
#FIO 2 = SCLK
#FIO 3 = CS

import ue9
import time
import sys

lj = ue9.UE9()

spicfg = {"SPIMode":"D", "SPIClockFactor": 0, "CSPINNum": 3, "CLKPinNum":2, "MISOPinNum":1, "MOSIPinNum":0} 
spicfgm = {"SPIMode":"D", "SPIClockFactor": 0, "CSPINNum": 5, "CLKPinNum":2, "MISOPinNum":1, "MOSIPinNum":0} 

def cs_active():
    lj.singleIO(1, 3, Dir=1, State=0)
    
def cs_idle():
    lj.singleIO(1, 3, Dir=1, State=1)
    
def fl_read_status():
    rv = lj.spi([0xD7, 0x00], **spicfg)
    return rv["SPIBytes"][1]

def fl_is_busy():
    return not (fl_read_status() & 0x80)
    
def fl_chip_erase():
    lj.spi([0xC7, 0x94, 0x80, 0x9A], **spicfg)

def fl_chip_read(address, length):
    tx = [0x0B, (address >> 16) & 0xFF, 
                (address >> 8) & 0xFF, 
                address & 0xFF, 0x00]
    cs_active()
    lj.spi(tx, **spicfgm)
    rvarr = []
    while length > 0:
        rv = lj.spi([0xdb]*16, **spicfgm)
        rvarr += rv["SPIBytes"][:length]
        length -= 16
    cs_idle()
    return rvarr

def fl_chip_read_chunked(address, length):
    rv = []
    while length > 0:
        print "\r 0x%05x left" % length,
        sys.stdout.flush()
        if length < 64:
            toread = length
        else:
            toread = 64
        rv += fl_chip_read(address, toread)
        length -= 64
        address += 64
    print "."
    return rv
    
def fl_chip_write_page(address, content):
    if address %512 != 0:
        print "Yo, your address is not page aligned"
        raise Error("Badness")
    if len(content) != 512:
        print "Yo, your page is not 512 bytes"
        raise Error("Badness")
    fl_block_idle()
    cs_active()
    lj.spi([0x82, (address >> 16) & 0xFF, 
                  (address >> 8) & 0xFF, 
                  address & 0xFF], AutoCS=False, **spicfgm)
    for i in range(len(content)/16):
        lj.spi(content[0:16], AutoCS=False, **spicfgm)
        content = content[16:]
    cs_idle()
    time.sleep(0.1)

def fl_chip_write(address, content):
    #print "Writing",(len(content)/512),"pages"
    if address %512 != 0:
        print "Yo, your address is not page aligned"
        raise Error("Badness")
    while len(content) > 0:
        #print "+>",
        page = content[0:512]
        page += [0]* (512-len(page))
        fl_chip_write_page(address, page)
        address += 512
        content = content[512:]
        print "\r 0x%05x left" % len(content),
        sys.stdout.flush()
    print "."  
def fl_set_512b():
    lj.spi([0x3D, 0x2A, 0x80, 0xA6], **spicfg)
    
def fl_block_idle():
    while fl_is_busy():
        print "Chip busy"
        time.sleep(1)   
              
def fl_chip_erase_block():  
    print "Erasing chip"
    fl_chip_erase()
    fl_block_idle()
    print "Done"

def fl_disable_protect():
    lj.spi([0x3D, 0x2A, 0x7F, 0x9A], **spicfg)  

def fl_read_lockdown():
    rv = lj.spi([0x35, 0xdb, 0xdb, 0xdb] + [0x00]*16, **spicfg)
    print "Sec lockdown: ",rv 
      
def prog_tst_pattern():
    #fl_chip_erase_block()
    x = range(2048)
    print "Writing:"
    fl_chip_write(0,x)
    print "Reading:"
    rv = fl_chip_read(0,512)
    print "rv is",rv

if fl_read_status() != 173:
    print "Flash chip not connected"
    sys.exit(1)
    
   
#fl_disable_protect()
#fl_read_lockdown()    
    
    
    
    
            
