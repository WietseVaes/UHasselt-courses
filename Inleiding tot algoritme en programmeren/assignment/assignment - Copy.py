import sys

a = sys.argv[1]
b = sys.argv[2]
c = sys.argv[3]

grondtal1 = int(a)
grondtal2 =int(b)
maxexp = int(c)

for i in range(grondtal1, grondtal2+1):
    t = 0
    for j in range(maxexp+1):
        x = i**j
        print(x, end=" ")
        t = t + x
    print("sum", t, sep=" ")