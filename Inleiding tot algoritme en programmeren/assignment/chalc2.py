argv=[]
if (len(argv)==0):
    print("no input provided")
for j in range(len(sys.argv)):
    calcs = sys.argv[j]
    tekens = "()*/%^+-1234567890"
    cijfersb ="1234567890("
    Qhaakjein = 0
    Qhaakjeuit = 0
    conditie = True

    if calcs[0] not in cijfersb:
        print(calcs)
        conditie = False
    for l in range(len(calcs)):
        if calcs[l] not in tekens and conditie:
            print(calcs)
            conditie = False
            break
    for i in range(len(calcs)):
       if calcs[i] in "(":
           Qhaakjein += 1
    for k in range(len(calcs)):
        if calcs[k] in ")":
            Qhaakjeuit += 1
    if conditie:
        if (Qhaakjein != Qhaakjeuit):
            print(calcs)