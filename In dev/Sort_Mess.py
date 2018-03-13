# Author: Waqar Muhammad - Carleton Physics 2018
# Project Repository: https://github.com/WaqarSM/4DCBCT-Code-Repository
# Written in: Python
#
#This code re-bins the *.SORT.txt file for higher number of bins
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

     sortList=[]
     rot=0
     for i in csvreader:
         sortList.append(i[2])
         # sortList+=i[2]
         print i[2]
         # print sortList
     #print counti
     print '-----'

     print sortList

     # sortListInt = [int(x) for x in sortList]
     # print sortListInt
     # print len(sortListInt)
plt.plot(sortList)
plt.ylabel('some numbers')
plt.show()
