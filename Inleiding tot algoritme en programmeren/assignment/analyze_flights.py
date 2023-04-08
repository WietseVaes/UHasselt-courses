# Author: Wietse Vaes
# Student number: 1848522
#
# I have not implemented the bonus task.

import sys

dataset = sys.argv[1]
rest = sys.argv[2]
filter = rest.split(";")
for i in range(2, len(sys.argv)):
    filter.append(sys.argv[i])

def count(list, filter):
    i = 0
    if len(filter) == 0:
        i += 1
        if len(line) == 0:

    else:
        listline = line.split(",")
        if filter in listline:
            i += 1
    return(i-1)

file = open(dataset, "r")
while True:
    line = file.readline()
    print("Flights:", count(line,filter), sep=" ")
