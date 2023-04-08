import sys
def collectie_maker(lengte, getal, collectie):
    if lengte == len(collectie):
        output = ""
        for i in range(lengte):
            output += collectie[i] + " "
            print(output)
    else:
        for i in range(getal):
            getal -= (1 + i)
            collectie = collectie + [getal+1]
            collectie_maker(lengte, getal, collectie)
n = int(sys.argv[1])
m = int(sys.argv[2])
collectie_maker(n,m,[])



