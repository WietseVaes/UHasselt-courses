import sys
def ss_helper(s, current):
    if len(s) == 0:
        for element in current:
            print(element, end=" ")
        print()
    else:
        head = s[0]
        tail = s[1:]
        ss_helper(tail, current)
        ss_helper(tail, current + [head])

def subsets(s):
    ss_helper(s, [])

s = []
for element in (5,4,3,2,1):
    s.append(int(element))
subsets(s)
