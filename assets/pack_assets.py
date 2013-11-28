
from png import Reader

def pack(fn):
    width, height, pixels, meta = Reader(filename=fn).asDirect()
    for row in xrange(0, height):
        for col in xrange(0, width):
            r, g, b = pixels[row][col*3:col*3+3]
            if r == 255 and g == 0 and b == 255:
                #thpecial alpha-esque pixel
    
