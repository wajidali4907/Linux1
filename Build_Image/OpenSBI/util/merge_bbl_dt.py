#!/usr/bin/env python3
#
# This is free software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
# 
# Author:   Muhammad Tahir

import sys
txtfile1 = sys.argv[-1]

with open(txtfile1, "r") as f1:
    f_data = f1.read()

txtfile2 = sys.argv[-2]

with open(txtfile2, "r") as f2:
    f2_data = f2.read()

#assert len(bindata) < 4*nwords
#assert len(bindata) % 4 == 0
bytes = len(f_data)
nwords = len(f_data) // 9

gap = 0x3800 - nwords

for i in range(gap):
    f_data += "00000000\n"

f_data += f2_data
  
with open ('mem_image.txt', 'w') as fp:
    fp.write(f_data)

f1.close()
f2.close()
fp.close()


