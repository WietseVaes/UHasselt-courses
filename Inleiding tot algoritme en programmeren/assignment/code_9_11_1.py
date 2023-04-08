import sys
def print_helper(length, max, set):
    if (length == len(set)):
        for element in set:
            print(element, end=" ")
        print()
    else:
        for i in range(0, max):
            new_value = max - i
            new_max = new_value - 1
            new_set = set + [new_value]
            print_helper(length, new_max, new_set)


def collections(n, m):
    print_helper(m, n, [])

n = int(sys.argv[1])
m = int(sys.argv[2])
collections(n ,m)
