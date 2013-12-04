
import qrcode

qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_H,
    box_size=1,
    border=0,
)

qr.add_data("http://pecs.cal-sdb.org/AABBCCDD")
m = qr.get_matrix()

print "Matrix size: ", len(m),len(m[0])

dat_arr = []
bitcount = 0
word = 0
for row in m:
    for e in row:
        word <<= 1
        if e:
            word |= 1
        bitcount += 1
        if bitcount == 8:
            dat_arr += [word]
            word = 0
            bitcount = 0
if bitcount != 0:
    while bitcount != 8:
        word <<= 1
        bitcount += 1
    dat_arr += [word]
           
print ",".join(["0x{:02x}".format(w) for w in dat_arr])
print "len:",len(dat_arr)
