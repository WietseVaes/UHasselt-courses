import sys

# Hier wordt de list gemaakt uit de gegeven string.
# Indien er een nested list start wordt er verwezen naar de volgende functie.
def list_maker(ratings):
    global i
    getal = ""
    list = []
    i = 1
    while True:
        if ratings[i] not in "[],":
            getal += ratings[i]
        elif ratings[i] == "," and not(ratings[i-1] == "]"):
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
# Deze recursieve functie wordt gebruikt als er een nested list in de list is.
# Dit maakt een list om toe tevoegen aan de initiele list.
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
        elif ratings[i] == "," and not(ratings[i-1] == "]"):
            list.append(int(getal))
            getal = ""
        elif ratings[i] == "[" :
            nested_list = nestedlist(ratings[i+1:])
            i +=  nestedlistnumber(ratings[i+1:])
            list.append(nested_list)
        i += 1

# Hier wordt een lokale i gebuikt om te berekenen hoeveel
# plaatsen het opgeschoven is in de functie van de nestedlist.
def nestedlistnumber(ratings):
    i = 0
    while True:
        if ratings[i] == "]":
            return(i+1)
        elif ratings[i] == "[":
            i +=  nestedlistnumber(ratings[i+1:])
        i += 1

# Eens de string omgezet is in een list wordt hier het gemiddelde berekent door te kijken of
# het een nested list is en dan daarvan het gemiddelde te nemen voor verder te gaan.
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