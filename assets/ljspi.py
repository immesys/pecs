
#FIO 0 = MOSI
#FIO 1 = MISO
#FIO 2 = SCLK
#FIO 3 = CS

import ue9
import time

lj = ue9.UE9()

def mosi(v):
    lj.singleIO(1, 0, Dir=1, State=(1 if v else 0))

def miso():
    return 1 if (lj.feedback(FIOMask=0b10, FIODir=0)["FIOState"] & 0b10 != 0) else 0
    #return lj.singleIO(1, 1, 0, State=1)

    

def clk_active():
    lj.singleIO(1, 2, Dir=1, State=0)  

def clk_idle():
    lj.singleIO(1, 2, Dir=1, State=1)  

def cs_active():
    lj.singleIO(1, 3, Dir=1, State=0)
    
def cs_idle():
    lj.singleIO(1, 3, Dir=1, State=1)

def bt():
    time.sleep(0.000001)  
      
def spi_b(v):
    v %= 256
    # SPI mode 3
    rv = 0
    for i in range(8):
        bv = v & 0x80
        v <<= 1
        mosi(bv)
        bt()
        clk_active()
        rv <<= 1
        rv |= miso()
        bt()
        clk_idle()
    return rv
    
def fl_read_status():
    cs_idle()
    bt()
    cs_active()
    bt()
    spi_b(0xD7)
    v1 = spi_b(0x00)
    bt()
    cs_idle()
    return v1

def fl_is_busy():
    return not (fl_read_status() & 0x80)
    
def fl_chip_erase():
    cs_idle()
    bt()
    cs_active()
    bt()
    spi_b(0xC7)
    spi_b(0x94)
    spi_b(0x80)
    spi_b(0x9A)
    bt()
    cs_idle()

def fl_chip_read(address, length):
    cs_idle()
    bt()
    cs_active()
    bt()
    spi_b(0x0B)
    spi_b(address >> 16)
    spi_b(address >> 8)
    spi_b(address)
    spi_b(0x00)
    rv = []
    for i in xrange(length):
        rv.append(spi_b(0xdb))
    bt()
    cs_idle()
    return rv

def fl_chip_write_page(address, content):
    if address %512 != 0:
        print "Yo, your address is not page aligned"
        raise Error("Badness")
    if len(content) != 512:
        print "Yo, your page is not 512 bytes"
        raise Error("Badness")
    cs_idle()
    bt()
    cs_active()
    bt()
    spi_b(0x82)
    spi_b(address >> 16)
    spi_b(address >> 8)
    spi_b(address)
    for v in content:
        spi_b(v)
    bt()
    cs_idle()
    fl_block_idle()

def fl_chip_write(address, content):
    if address %512 != 0:
        print "Yo, your address is not page aligned"
        raise Error("Badness")
    while len(content) > 0:
        page = content[0:512]
        page += [0]* (512-len(page))
        fl_chip_write_page(address, page)
        address += 512
        content = content[512:]
        
def fl_set_256b():
    cs_idle()
    bt()
    cs_active()
    bt()
    spi_b(0x3D)
    spi_b(0x2A)
    spi_b(0x80)
    spi_b(0xA6)
    bt()
    cs_idle()
    fl_block_idle()
    print "Chip set to 256b"
    
def fl_block_idle():
    while fl_is_busy():
        print "Chip busy"
        time.sleep(1)   
              
def fl_chip_erase_block():
    
    print "Erasing chip"
    fl_chip_erase()
    fl_block_idle()
    print "Done"
      
def prog_tst_pattern():
    #fl_chip_erase_block()
    x = range(2048)
    print "Writing:"
    fl_chip_write(0,x)
    print "Reading:"
    rv = fl_chip_read(0,512)
    print "rv is",rv

#print fl_read_status()    
#prog_tst_pattern()
    
    
    
    
    
    
            
