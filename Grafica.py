import time
import sys
import numpy as np
import sympy as sp
import matplotlib as mp
import matplotlib.pyplot as plt

# We obtain the data
times=[]
with open("times.txt","r", encoding='utf-8') as f:
    for line in f:
        times.append([float(x.strip()) for x in line.split(",")])

# We reduce the data to the same length
minum = len(times[0])
for i in times:
    if len(i) < minum:
        minum = len(i)
for i in times:
    i = i[:minum-1]

# We calculate the averages
averages = []
for i in range(minum):
    averages.append(sum([x[i] for x in times])/len(times))



plt.plot([x+1 for x in range(minum)],averages)
plt.title('Texto va aquí', fontsize=12)
plt.grid()

plt.scatter([x+1 for x in range(minum)], averages, s=10, c='r')
for i in times:
    plt.scatter([x+1 for x in range(minum)], i, s=10, c='g')

plt.xlabel('Thread')
plt.ylabel('Time')
plt.show()