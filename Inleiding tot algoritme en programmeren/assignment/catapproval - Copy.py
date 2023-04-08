import sys


def list_maker(ratings):
    global i
    getal = ""
    list = []
    i = 1
    while True:
        if ratings[i] not in "[],":
            getal += ratings[i]
        elif ratings[i] == ",":
            list.append(int(getal))
            getal = ""
        elif ratings[i] == "[":
            nested_list = nestedlist(ratings[i+1:])
            i +=  nestedlistnumber(ratings[i+1:])
            list.append(nested_list)
        i += 1
        if ratings[len(ratings) - 2] == "]" and i == len(ratings) + 1:
            return list
        if i == len(ratings):
            if getal != "":
                list.append(int(getal))
            return(list)

def nestedlist(ratings):
    i = 0
    list = []
    getal = ""
    while True:
        if ratings[i] == "]":
            if ratings[i-1] == "]":
                return(list)
            list.append(int(getal))
            return(list)
        if ratings[i] not in "[],":
            getal += ratings[i]
        elif ratings[i] == ",":
            list.append(int(getal))
            getal = ""
        elif ratings[i] == "[":
            nested_list = nestedlist(ratings[i+1:])
            i +=  nestedlistnumber(ratings[i+1:])
            list.append(nested_list)
        i += 1

def nestedlistnumber(ratings):
    i = 0
    while True:
        if ratings[i] == "]":
            return(i+2)
        elif ratings[i] == "[":
            i +=  nestedlistnumber(ratings[i+1:])
        i += 1



def gemiddelde(ratings):
    som = 0
    for i in range(len(ratings)):
        if type(ratings[i]) == type([]):
            ratings[i] = gemiddelde(ratings[i])
        som += int(ratings[i])
    return (som//len(ratings))

ratings = sys.argv[1]

list = list_maker(ratings)

print("Average approval rate is", gemiddelde(list))