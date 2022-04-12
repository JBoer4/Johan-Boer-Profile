import os


# The inverse operation of arrayPrint That is it takes a string of numbers separated by a space to an array
def line2array(line):
    array = line.split()
    for i in range(len(array)):
        array[i] = float(array[i])
    return array


# Returns an array of arrays for each line of a string using line2array
def lines2arrays(lines):
    array = lines.split("\n")
    for i in range(len(array)):
        array[i] = line2array(array[i])
    return (array)


# Grabbing Data From data.dat
def DataParse():
    fileDir = os.path.dirname(os.path.realpath('__file__'))
    datadat = os.path.join(fileDir, 'data.dat')
    dataFile = open(datadat, "r")

    # Get lines from data.dat in an array
    dataLines = []
    for line in dataFile:
        dataLines.append(line)

    # Reduce the data to the numerical values in an array
    output = [0]
    for i in range(len(dataLines)):
        output.append(dataLines[i][1])
        for j in range(2, 26):
            output[i + 1] += dataLines[i][j]

    # Reformat from strings to floats
    for i in range(len(output)):
        output[i] = float(output[i])

    return output


dat = DataParse()
