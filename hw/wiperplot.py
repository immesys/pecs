from pylab import *

vc = 1.25
v = arange(0,256)
def func(v):
    r1 = 10*(v/255.) + 3.9
    r2 = 10*((255-v)/255.) + 33
    return vc * (r1 + r2) / (r1)
    
plot(v, [func(i) for i in v])

xlabel('Wiper (counts)')
ylabel('voltage (V)')
title('Wiper range for 3k9 and 33k')
grid(True)
savefig("wiper_range_3k9_33k.png")
show()
