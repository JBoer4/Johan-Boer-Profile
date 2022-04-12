# Receiver
# Given positions and times of satellites returns vehicle information

import sys
import A1
import math
import data
import numpy as np

c = data.dat[2]
log = open("receiver.log", "w")  # Open and start the log file
log.write("Read:\n")

# Get input from Satellite
def get_input():
    iteration = []
    i_s = [0]
    t_s = []
    x_s = []
    for line in sys.stdin:
        inps = line.split(' ')
        log.write(line)  # Write the input line by line
        arr = [float(i) for i in inps]
        if arr[0] <= i_s[-1]:
            iteration.append([i_s[1:], t_s, x_s])
            i_s = [0]
            t_s = []
            x_s = []
        i_s.append(int(arr[0]))
        t_s.append(arr[1])
        x_s.append([arr[2], arr[3], arr[4]])

    iteration.append([i_s[1:], t_s, x_s])
    return iteration

# compute Jabocian of x_k
def comp_jac(x_s, x_k):
    j = np.zeros((3,3))
    for i in range(3):
        for k in range(3):
            j[i][k] = ((x_s[i][k] - x_k[k])/A1.norm2(A1.vSub(x_s[i],x_k))) - ((x_s[i+1][k] - x_k[k])/A1.norm2(A1.vSub(x_s[i+1], x_k)))
    return j

# compute -F(x_k)
def comp_F_x(x_s, t_s, x_k):
    v = []
    for i in range(3):
        v.append((A1.norm2(A1.vSub(x_s[i+1], x_k))-A1.norm2(A1.vSub(x_s[i],x_k))-c*(t_s[i]-t_s[i+1]))*-1)

    return v

# compute vehicle position
def comp_x(x_s,t_s, x_k):
    x_k1 = x_k
    while True:
        f = comp_F_x(x_s,t_s,x_k1)
        j = comp_jac(x_s, x_k1)
        s = np.linalg.solve(j,f)
        x_k1 = A1.vAdd(s, x_k1)

        if A1.norm2(s) < .01:
            return x_k1

# Compute vehicle time given vehicle position, satellite position, satellite time
def comp_t(x_v, x_s, t_s):
    return A1.norm2(A1.vSub(x_s[0],x_v))/c + t_s[0]


# Using above functions computes x_v and t_v for each iteration given
def main_loop():
    iteration = get_input()
    log.write("Wrote:\n")  # Start the output section of the log file
    outputs = []

    t = iteration[0][0][0]
    b12  = [t, 40, 45, 55, 1 ,11, 50, 58, -1, 1372]
    x = A1.gps2cart(b12)
    x= [x[1],x[2],x[3]]

    for i in range(len(iteration)):
        i_s = iteration[i][0]
        t_s = iteration[i][1][:4]
        x_s = iteration[i][2][:4]

        x = comp_x(x_s, t_s, x)
        x_t = comp_t(x, x_s,t_s)

        outputs.append(A1.cart2gps([x_t, x[0], x[1], x[2]]))

    return outputs

# prints the outputs in desired format
def print_outputs(outputs):
    for output in outputs:
        # Print to stdout
        print output[0], output[1], output[2], output[3], output[4], output[5], output[6], output[7], output[8], output[9]
        # Write the same thing to the log file
        log.write(str(output[0])+" "+ str(output[1])+" "+ str(output[2])+" "+ str(output[3])+" "+ str(output[4])+" "+ str(output[5])+" "+ str(output[6])+" "+ str(output[7])+" "+ str(output[8])+" "+ str(output[9])+"\n")


print_outputs(main_loop())

