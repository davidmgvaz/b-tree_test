import random

for i in (10,32,64):
    print random.sample(xrange(100000), i*1024)

for i in (128,256,512):
    print random.sample(xrange(1000000), i*1024)

print random.sample(xrange(10000000), 1024*1024)

print random.sample(xrange(100000000), 1024*1024)
