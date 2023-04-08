
nucbaselist = ["A", "C", "G", "T"]
nucbasecombinationlist = []

def nucbasegenerator(nucstring, n):
    if n > 0:
        for nuclidebase in nucbaselist:
           nucbasegenerator(nucstring + nuclidebase, n - 1)
    if n == 0:
        nucbasecombinationlist.append(nucstring)


def nucbasecombinationprinter(nucbasecomblist, m):
    printed = 0
    for combination in nucbasecomblist:
        printed += 1
        if printed % (2 ** (m - 1)) == 0:
            print(combination, end="\n")
        else:
            print(combination, end=" ")

n, m = int(input("n = ")), 0
nucbasegenerator("", n)
nucbasecombinationprinter(nucbasecombinationlist, m)
