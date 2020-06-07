fh = open('llamarace.bas', 'rb')
ba = bytearray(fh.read())

out = ''
for b in ba:
    if b<128:
        out += chr(b)
    else:
        out += 'CHR$('+ str(b) + ') +'# print('chr$('+ str(b) + ') +')
print(out)
#for byte in ba:
#    print(byte & 1)
# import struct
# file = open('out.bas', 'w')
# lineno = 10
# with open('llamarace.bas', 'rb') as mc10file:
#     ba = bytearray(fh.read())
#     for byte in ba:
#         print byte & 1
#     # byte = mc10file.read(1)
#     # print(byte)
#     # while byte != "":
#     #     print(byte)
#     #     # value = struct.unpack('B', byte[0])[0]
        
#     #     # if value < 128:
#     #     #     print(chr(int(byte)))
#     #     byte = mc10file.read(1)
# file.close()