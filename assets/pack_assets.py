
from png import Reader, Writer
import sys
import time

"""
From the chips perspective, there are two types of images. 
Full rectangle images have the advantage that rectangular slices out of the image can be
easily calculated for drawing part of the slider for example.
Overlay images have the advantage that you get a pseudo alpha capability for rounded images
and whatnot.

A full rectangle is drawn with a screen start X, Y, the width and height of the image in flash,
the X,Y coordinates to start the window in flash, and the width and height of the window.
For a more basic full rectangle that covers the whole screen, basically you just start drawing
and keep going.

An overlay image is drawn by checking if the read byte is a sentinel (0b11110111 == 0xF7)
and if it is, it reads the next two bytes as the X and Y coordinate to jump to. Naturally
you can't cover the whole screen if you do that, but it's intended for small buttony things.
The sentinel was chosen as it  represents the least significant bit of red clear, so if that
naturally occurs, it's easy to just push it up to white
"""

def pack(fn, t="rectangle"):
    fn = fn+".png"
    in_skip = False
    width, height, pixels, meta = Reader(filename=fn).asRGBA()
    mem = []
    allrows = [pixels.next() for i in xrange(height)]
    allrows.reverse() #Screen has different zero indexing
    row = 0
    for rowd in allrows:
        if t == "overlay":
            #Overlay type images don't have automatic logic to go to the next
            #row. We synthesize this by pretending we are in a skip block. 
            #This is harmless if we actually _are_ in a skip block
            in_skip = True
            
        for col in xrange(0, width):
            r, g, b, a = rowd[col*4:col*4+4]
            if t == "overlay":  
                if a < 128 and not in_skip:
                    in_skip = True
                elif a >= 128:
                    if in_skip:
                        in_skip = False
                        mem.append(0xF7)
                        mem.append(col)
                        mem.append(row)
                    b1 = (r & 0xf8) + (g >> 5)&0xFF
                    b2 = ((g << 3)&0xe0) + (b >> 3)
                    if b1 == 0xF7:
                        b1 = 0xFF
                    if b2 == 0xF7:
                        b2 = 0xF8
                    mem.append(b1)
                    mem.append(b2)
            if t == "rectangle":
                mem.append( ((r & 0xf8) + (g >> 5))&0xFF )
                mem.append( ((g << 3)&0xe0) + (b >> 3) )
        row += 1
    
    f = open(fn+".map.hex","w")
    for idx in xrange(len(mem)):
        if idx%16 == 0 and idx != 0:
            f.write("\n")
        f.write("%02x " % mem[idx])
    f.close()             
    print "Packed {:16s} ({:>3}x{:<3} = {:5d}) in 0x{:>5x} bytes, {:>3} pages {:.2f}%".format(fn, width, height, width*height, len(mem), len(mem)/512, len(mem)/(512*40.96))
    #print "Image packed,",(width*height),"pixels in",len(mem),"bytes (",hex(len(mem)),")",(len(mem)/512),"pages",(len(mem)/(512*40.96)),"%"
    return (mem, width, height)

if len(sys.argv) != 2:
    print "need command"
    sys.exit(1)

images = [
        ("bars","rectangle"), 
        ("bluebar","rectangle"),
        ("redbar","rectangle"),
        ("slider_knob","overlay"), 
        ("up2","rectangle"),
        ("sdb","rectangle"),
        ("pecs","rectangle"),
        ("point","rectangle"),
        ("calibrate", "rectangle"),
        ("bluebar2","rectangle"),
        ("redbar2","rectangle"),
        ("1","rectangle"),
        ("2","rectangle"),
        ("3","rectangle"),
        ("4","rectangle"),
        ("5","rectangle"),
        ("6","rectangle"),
        ("7","rectangle"),
        ("8","rectangle"),
        ("9","rectangle"),
        ("A","rectangle"),
        ("B","rectangle"),
        ("C","rectangle"),
        ("D","rectangle"),
        ("E","rectangle"),
        ("F","rectangle")
        ]

if sys.argv[1] == "make":                        
    for fn, t in images:
        pack(fn, t)
        
elif sys.argv[1] == "makeprog":
    #global fastspi
    #fastspi = __import__("fastspi")
    memsize = 2097152
    pagesize = 256
    memory = [00]*memsize
    assets = []
    for fn, t in images:
        assets.append((fn, pack(fn, t)))
    addr = 0
    amap = []
    then = time.time()
    for a in assets:
        amap += [(a[0], addr, a[1])]
        print "Programming %s to 0x%05x (rtotalp = 0x%04x/0x%04x)" % (a[0], addr, (addr+len(a[1][0])+pagesize)/pagesize, memsize/pagesize)
        laddr = addr
        for x in a[1][0]:
            memory[laddr] = x
            laddr += 1
        #fastspi.fl_chip_write(addr, a[1][0])
        
        #print "Reading back for verify"
        #memb = fastspi.fl_chip_read_chunked(addr, len(a[1][0]))
        #for k in xrange(len(a[1][0])):
        #    if memb[k] != a[1][0][k]:
        #        print "Byte mismatch at 0x%06x wanted 0x%02x got %02x" %(addr+k, a[1][0][k], memb[k])
                
        addr += len(a[1][0])
        if addr % pagesize != 0:
            addr += pagesize - (addr%pagesize)
    f = open("assets.hex", "w")
    for x in xrange(memsize):
        if x != 0 and x % 32 == 0:
           f.write("\n")
        f.write("{:02x} ".format(memory[x]))
    f.close()
    f = open("assets.h","w")
    f.write("//Autogenerated by pack_assets.py on "+time.ctime()+"\n");
    f.write("#ifndef __ASSETS_H__\n#define __ASSETS_H__\n");
    print "Programming complete (%.2fs)" % (time.time() - then)            
    print "Final asset constants:"
    for a in amap:
        s = "#define ASSET_%s_ADDR   0x%06x\n" % (a[0].upper(), a[1])
        s += "#define ASSET_%s_LENGTH 0x%06x\n" % (a[0].upper(), len(a[2][0]))
        s += "#define ASSET_%s_WIDTH  %d\n" % (a[0].upper(), a[2][1])
        s += "#define ASSET_%s_HEIGHT %d\n" % (a[0].upper(), a[2][2])
        f.write(s)
        print s,
    f.write("#endif //[410]\n");
    f.close()
    
    
    
    
    
    
    
    
    
    
    
       
