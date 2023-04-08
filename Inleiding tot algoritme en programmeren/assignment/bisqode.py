import sys

def totsom(string):
    som = 0
    for i in range(len(string)):
        waarde = ord(string[i]) - 97
        if 0<=waarde<=26:
            som += waarde * (27**(len(string)-(i+1)))
        elif string[i]== " ":
            som += 26 * (27**(len(string)-(i+1)))
    return(som)

def bitransformer(totale_som):
    binaire=""
    while totale_som > 0:
        stuk = totale_som % 2
        totale_som = totale_som // 2
        binaire = str(stuk) + binaire
    return(binaire)

def toevoegen(bi):
    global i
    i = 0
    conditie = True
    while conditie:
        if i**2<=len(bi)<=(i+1)**2:
            conditie = False
        i += 1
    while len(bi) != i**2:
        bi = "0" + bi
    return(bi)

def printer(bi):
    uitkomst = ""
    k = 0
    bi += "#"
    for j in range(len(bi)):
        if k < i:
            uitkomst += bi[j]
            k += 1
        else:
            print(uitkomst)
            uitkomst = bi[j]
            k = 1

if sys.argv[1] == "":
    print(sys.argv[1])
else:
    x = totsom(sys.argv[1])

    y = bitransformer(x)

    z = toevoegen(y)

    printer(z)


