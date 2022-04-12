# Code for Assignment 1. Includes formulas for GPS and motion
import math
import data

# Global Variables
R = data.dat[3]  # Radius of Earth in meters
s = data.dat[4]  # Time for the earth to rotate 1 sidereal day in seconds
h = data.dat[12]  # Altitude of satellites in meters
p = data.dat[11]  # Period of rotation for satellites
pi = data.dat[1]


# DMS refers to degree minute second angle
# Code from DMS to Radians and the inverse
def dms2rad(degrees, minutes, seconds, ns):
    if degrees < 0 or degrees >= 180 or minutes < 0 or minutes >= 60 or seconds < 0 or seconds >= 60 or ns * ns != 1:
        return "error"  # assure input is of the correct type
    degs = degrees + minutes / 60 + seconds / 3600
    rad = pi * degs / 180
    rad *= ns
    return rad


def rad2dms(rad):
    while rad > pi or rad <= -pi:  # restrict domain of radians to (-pi,pi]
        if rad > pi:
            rad -= 2 * pi
        else:
            rad += 2 * pi
    if rad == abs(rad):
        ns = 1
    else:
        ns = -1
    degs = 180 * abs(rad) / pi
    degrees = int(degs)
    degs -= degrees
    degs *= 60
    minutes = int(degs)
    degs -= minutes
    seconds = 60 * degs
    return [degrees, minutes, seconds, ns]


# function to convert from gps position to cartesian position on Earth
# gps coords are in the form [0:tv,1:latDeg,2:latMin,3:latSec,4:ns,5:longDeg,6:longMin,7:longSec,8:ew,9:altitude)
# cartesian coords are in the form [0:t,1:x,2:y,3:z)
def gps2cart(gpspos):
    rotation = 2 * pi * gpspos[0] / s
    rLat = dms2rad(gpspos[1], gpspos[2], gpspos[3], gpspos[4])  # latitude in radians
    rLong = dms2rad(gpspos[5], gpspos[6], gpspos[7], gpspos[8])  # longitude in radians
    x0 = (R + gpspos[9]) * math.cos(rLat) * math.cos(rLong)
    y0 = (R + gpspos[9]) * math.cos(rLat) * math.sin(rLong)
    # apply rotation matrix
    z = (R + gpspos[9]) * math.sin(rLat)
    x = x0 * math.cos(rotation) - y0 * math.sin(rotation)
    y = x0 * math.sin(rotation) + y0 * math.cos(rotation)
    return [gpspos[0], x, y, z]


def cart2gps(cartpos):
    rotation = -2 * pi * cartpos[0] / s
    # invert rotation matrix
    x = cartpos[1] * math.cos(rotation) - cartpos[2] * math.sin(rotation)
    y = cartpos[1] * math.sin(rotation) + cartpos[2] * math.cos(rotation)
    z = cartpos[3]
    # altitude for latitude calculation
    altitude = math.sqrt(x ** 2 + y ** 2 + z ** 2) - R
    # find latitude in dms
    rLat = math.asin(z / (R + altitude))
    lat = rad2dms(rLat)  # lat = [degrees, minutes, seconds, ns]
    # find longitude in dms
    if x == 0:  # cases are to avoid /by0 cases and to set the domain of longitude to (-pi,pi)
        rLong = 0
    elif x < 0:
        rLong = pi + math.atan(y / x)
    else:
        if y > 0:
            rLong = math.atan(y / x)
        else:
            rLong = 2 * pi + math.atan(y / x)
    long = rad2dms(rLong)  # long = [degrees, minutes, seconds, ew]
    # gps coords are in the form [0:tv,1:latDeg,2:latMin,3:latSec,4:ns,5:longDeg,6:longMin,7:longSec,8:ew,9:altitude)
    return [cartpos[0], lat[0], lat[1], lat[2], lat[3], long[0], long[1], long[2], long[3], altitude]


# condition to see if a point in space is above the horizon with respect to a point on earth
# positions are given in cartesian coords [x,y,z] ep on earth sp in space
def aboveHorizon(x, sp):
    epTep = x[0] * x[0] + x[1] * x[1] + x[2] * x[2]  # ep dot ep or the norm of ep
    epTsp = x[0] * sp[0] + x[1] * sp[1] + x[2] * sp[2]  # if sp dot ep is bigger than the norm of ep it is above
    if epTsp > epTep:
        return True
    else:
        return False


# 2norm of a vector
def norm2(vector):
    dimension = len(vector)
    result = 0
    for i in range(dimension):
        result += vector[i] * vector[i]
    result = math.sqrt(result)
    return result


# vector addition
def vAdd(v1, v2):
    result = []
    for i in range(len(v1)):
        result.append(v1[i]+v2[i])
    return result


# scalar multiplication
def vMult(c, v):
    result = []
    for i in range(len(v)):
        result.append(c*v[i])
    return result


# vector subtraction
def vSub(v1,v2):
    return vAdd(v1, vMult(-1,v2))
