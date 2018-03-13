# Author: Waqar Muhammad - Carleton Physics 2018
# Project Repository: https://github.com/WaqarSM/4DCBCT-Code-Repository
# Written in: Python
#
#This code re-bins the *.SORT.txt file for higher number of bins
#TODO: Comment this Code

#In developement! 
import csv
import xml.etree.ElementTree as ET
import numpy as np
import array
import shutil
import os
import matplotlib.pyplot as plt
#------------------File Locations-------------
# Change the hisFileLoc to the location of the *.HIS file Projections

hisFileLoc= '/Users/mwaqar/4DCBCT_Project/img_1.3.46.423632.1354522017101323933437.72/'
sortFileLoc = hisFileLoc+'Reconstruction/1.3.46.423632.1354522017101323933437.72.10.13.2017191452671.SCAN.Sort.txt'
xmlFileLoc= hisFileLoc+'_Frames.xml'
sortedFileLoc = hisFileLoc+'sorted'

#------------------Parsing Sort file------------------
with open(sortFileLoc, 'rb') as csvfile:
    csvreader = csv.reader(csvfile, delimiter='\t', quotechar='|')
    col1=[]
    col2=[]
    col3=[]
    col4=[]
    col5=[]
    newBinNum=20
    for i in csvreader:
        col1.append(float(i[0]))
        col2.append(i[1])
        col3.append(float(i[2]))
        col4.append(i[3])
        col5.append(i[4])
        # print i[0]
        # print i[1]
        # print i[2]
        # print i[3]
        # print i[4]

print '-----'
print col3
print "File Length =",len(col3)
maxCol3 = float(max(col3))
minCol3= float(min(col3))
print "Min Value =",minCol3
print "Max value =", maxCol3
Col3Delta = maxCol3 - minCol3
binStep= Col3Delta/newBinNum
print "Bin Step =",binStep

newCol4=[]

for i in range(len(col3)):
    for j in range(newBinNum+1):
        # print j
        if binStep*(j) <= col3[i] <= binStep*(j+1):
            newCol4.append(j)

print newCol4
print (newCol4.count(0))

with open('filename.SORT.txt', 'wb+') as csvfile1:
    spamwriter = csv.writer(csvfile1, delimiter='\t',quotechar='|', quoting=csv.QUOTE_MINIMAL)
    for i in range(len(col3)):
     spamwriter.writerow([col1[i], col2[i], col3[i], newCol4[i], col5[i]])



# num_bins = 20
# n, bins, patches = plt.hist(newCol4, num_bins, facecolor='blue')
# n, bins, patches = plt.hist(col4, num_bins, facecolor='red')
# plt.show()
