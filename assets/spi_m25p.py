
#FIO 0 = MOSI
#FIO 1 = MISO
#FIO 2 = SCLK
#FIO 3 = CS

import ue9
import time
import sys

lj = ue9.UE9()

spicfg = {"SPIMode":"A", "SPIClockFactor": 0, "CSPINNum": 3, "CLKPinNum":2, "MISOPinNum":1, "MOSIPinNum":0} 
spicfgm = {"SPIMode":"A", "SPIClockFactor": 0, "CSPINNum": 5, "CLKPinNum":2, "MISOPinNum":1, "MOSIPinNum":0} 

def cs_active():
    lj.singleIO(1, 3, Dir=1, State=0)
    
def cs_idle():
    lj.singleIO(1, 3, Dir=1, State=1)
    
def fl_read_status():
    rv = lj.spi([0x05, 0x00], **spicfg)
    return rv["SPIBytes"][1]

def fl_is_busy():
    rv = fl_read_status()
    print "status: ", rv
    return rv & 0x01
    
def fl_chip_erase():
    lj.spi([0xC7], **spicfg)

def fl_chip_read(address, length):
    tx = [0x0B, 0x00, (address >> 16) & 0xFF, 
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
        if length < 64:
            toread = length
        else:
            toread = 64
        rv += fl_chip_read(address, toread)
        length -= 64
        address += 64
        print "\r 0x%05x left" % length,
        sys.stdout.flush()
    print "."
    return rv

def fl_write_enable():
    lj.spi([0x06], **spicfg)
        
def fl_chip_write_page(address, content):
    if address % 256 != 0:
        print "Yo, your address is not page aligned"
        raise Error("Badness")
    if len(content) != 256:
        print "Yo, your page is not 256 bytes"
        raise Error("Badness")
    fl_block_idle()
    fl_write_enable()
    cs_active()
    lj.spi([0x02, (address >> 16) & 0xFF, 
                  (address >> 8) & 0xFF, 
                  address & 0xFF], **spicfgm)
    for i in range(len(content)/16):
        lj.spi(content[0:16], **spicfgm)
        content = content[16:]
    cs_idle()

def fl_chip_write(address, content):
    if address %256 != 0:
        print "Yo, your address is not page aligned"
        raise Error("Badness")
    while len(content) > 0:
        #print "+>",
        page = content[0:256]
        page += [0]* (256-len(page))
        fl_chip_write_page(address, page)
        fl_block_idle()
        address += 256
        content = content[256:]
        print "\r 0x%05x left" % len(content),
        sys.stdout.flush()
    print "."  
    
def fl_block_idle():
    while fl_is_busy():
        pass
              
def fl_chip_erase_block():
    fl_write_enable()  
    print "Erasing chip"
    fl_chip_erase()
    fl_block_idle()
    print "Done"
      
def prog_tst_pattern():
    
    fl_chip_erase_block()
    x = range(2048)
    print "Writing:"
    fl_chip_write(0,x)
    print "Reading:"
    rv = fl_chip_read(0,512)
    print "rv is",rv

def read_sig():
    cs_active()
    time.sleep(0.01)
    rv = lj.spi([0x9f, 0x00, 0x00, 0x00], **spicfgm)
    time.sleep(0.01)
    cs_idle()
    return rv["SPIBytes"][1:]


for i in range(10):
    print read_sig()
#print fl_read_status()
#fl_write_enable()
#print fl_read_status()
#prog_tst_pattern()

    
    
    
    
            
