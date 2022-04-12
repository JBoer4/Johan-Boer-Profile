import A1
import data
import math
import sys

stdin = sys.stdin.read()
stdinA = data.lines2arrays(stdin)
stdinA.pop(-1)
# Global Variables
R = data.dat[3]  # Radius of Earth in meters
s = data.dat[4]  # Time for the earth to rotate 1 sidereal day in seconds
h = data.dat[12]  # Altitude of satellites in meters
p = data.dat[11]  # Period of rotation for satellites
pi = data.dat[1]
c = data.dat[2]  # Speed of Light in m/s

log = open("satellite.log", "w")
log.write("Read:\n" + stdin)


# Function to give the position of a satellite at a given time
def satPos(time, index):
    satdata = []
    for i in range(1, 10):
        satdata.append(data.dat[9 * index + 4 + i])

    posX0 = (R + h) * (satdata[0] * math.cos(((2 * pi * time) / p) + satdata[8]) + satdata[3] * math.sin(
        (2 * pi * time) / p + satdata[8]))
    posY0 = (R + h) * (satdata[1] * math.cos((2 * pi * time) / p + satdata[8]) + satdata[4] * math.sin(
        (2 * pi * time) / p + satdata[8]))
    posZ0 = (R + h) * (satdata[2] * math.cos((2 * pi * time) / p + satdata[8]) + satdata[5] * math.sin(
        (2 * pi * time) / p + satdata[8]))
    return [posX0, posY0, posZ0]


def satTime(vgps, index):
    vpos = A1.gps2cart(vgps)
    xv = [vpos[1], vpos[2], vpos[3]]
    tv = vpos[0]
    t0 = tv
    t1 = tv - (A1.norm2(A1.vSub(satPos(tv, index), xv))) / c
    tk = [t0, t1]
    while abs(tk[-1] - tk[-2]) >= (.01 / c):
        tTemp = tv - (A1.norm2(A1.vSub(satPos(tk[-1], index), xv))) / c
        tk.append(tTemp)

    return tk[-1]


def getValid(vgps):
    xpos = A1.gps2cart(vgps)
    tv = xpos[0]
    ep = [xpos[1], xpos[2], xpos[3]]
    valid = []
    for i in range(24):
        sp = (satPos(satTime(vgps, i), i))
        if A1.aboveHorizon(ep, sp):
            valid.append(i)
    return valid


log.write("Wrote:\n")
for i in range(len(stdinA)):
    for index in getValid(stdinA[i]):
        st = satTime(stdinA[i], index)
        sp = satPos(st, index)
        output = [index, st, sp[0], sp[1], sp[2]]
        log.write(str(index) + " " + str('{0:.12f}'.format(st)) + " " + str('{0:.12f}'.format(sp[0])) + " " + str(
            '{0:.12f}'.format(sp[1])) + " " + str('{0:.12f}'.format(sp[2])) + "\n")
        print(str(index) + " " + str('{0:.12f}'.format(st)) + " " + str('{0:.12f}'.format(sp[0])) + " " + str(
            '{0:.12f}'.format(sp[1])) + " " + str('{0:.12f}'.format(sp[2])))
