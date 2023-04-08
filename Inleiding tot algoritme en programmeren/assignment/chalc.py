import sys

correct = 0

for j in range(1, len(sys.argv)):

    calcs = sys.argv[j]
    alles = "()*/%^+-1234567890"
    cijfersb ="1234567890("
    cijfers = "1234567890"
    tekens = "*/%^+-"
    pqsv = "*/^%+-("
    cijfersh = "1234567890()"
    qhaakjein = 0
    qhaakjeuit = 0
    conditie = True
    a = 0

    if calcs[0] not in cijfersb:
        print(calcs)
        conditie = False

    if (calcs[len(calcs)-1] in pqsv and conditie):
        print(calcs)
        conditie = False

    for i in range(len(calcs)-1):
        if conditie and calcs[i] in ")" and calcs[i+1] in cijfers:
            print(calcs)
            conditie = False

    for i in range(len(calcs)-2):
        if conditie and calcs[i] in "(" and (calcs[i+1] in cijfers or calcs[i+1] in tekens) and calcs[i+2] in cijfersb:
            print(calcs)
            conditie = False

    for m in range(len(calcs)-3):
        if conditie and calcs[m] in ")" and (calcs[m+1] in "("  or (calcs[m+1] in cijfers and (calcs[m+2] in "()" or (calcs[m+2] in cijfers and calcs[m+3] in "()")))):
            print(calcs)
            conditie = False

    for p in range(len(calcs)-1):
        if calcs[p] in tekens and calcs[p+1] in tekens and conditie:
            print(calcs)
            conditie = False
        if calcs[p] == "(" and calcs[p+1] == ")" and conditie:
            print(calcs)
            conditie = False

    for l in range(len(calcs)):
        if calcs[l] not in alles and conditie:
            print(calcs)
            conditie = False
            break

    while a in range(len(calcs)) and conditie:
        if calcs[a] in "(":
            qhaakjein += 1
        elif calcs[a] in ")":
            qhaakjeuit += 1
        if qhaakjein < qhaakjeuit:
            print(calcs)
            conditie = False
        a += 1
    if (qhaakjein != qhaakjeuit) and conditie:
        print(calcs)
        conditie = False
    if conditie:
        correct += 1

if correct == len(sys.argv)-1 and len(sys.argv)-1>0:
    print("correct")

elif correct == len(sys.argv)-1 and len(sys.argv)-1 == 0:
    print("no input provided")