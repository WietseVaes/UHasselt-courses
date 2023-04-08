def in_range(value, a, b):
    return (a <= value) and (value <= b)


def in_rectangle(px, py, rx, ry, rw, rh):
    return (in_range(px, rx, rx + rw) and
            in_range(py, ry, ry + rh))


def does_intersect(x1, y1, w1, h1,
                   x2, y2, w2, h2):
    # If there is an intersection, then the
    # intersection can be represented by a
    # rectangle.

    # We do so by  computing the left-bottom and
    # the top-right corners. For the left-bottom
    # we have three cases:
    # + the left-bottom corners of the two
    #   rectangles are at the same position
    # + the left-bottom corner is at the
    #   intersection of the left side of the
    #   first and the bottom side of the second
    #   rectangle
    # + the left-bottom corner is at the
    #   intersection of the bottom side of the
    #   first and the left side of the second
    #   rectangle
    # + In all these cases: new left-bottom
    #   corner is (max(x-coord) , max(y-coord)).
    ix = max(x1, x2)
    iy = max(y1, y2)

    # Reasoning: similar as for left-bottom
    # corner.
    jx = min(x1 + w1, x2 + w2)
    jy = min(y1 + h1, y2 + h2)


    # First: check if the intersection is not a line
    # (adjacent rectangles)
    if (ix == jx or iy == jy):
        return False

    # Then: is there an intersection? (Or:
    # new rectangle in between the two rectangles)
    elif (in_rectangle(ix, iy, x1, y1, w1, h1) and
          in_rectangle(ix, iy, x2, y2, w2, h2) and
          in_rectangle(jx, jy, x1, y1, w1, h1) and
          in_rectangle(jx, jy, x2, y2, w2, h2)):
        return True
    else:
        return False


print(does_intersect(1, 1, 2, 2, 1, 2, 1, 3))
print(does_intersect(1, 1, 2, 2, 1, 3, 2, 2))
