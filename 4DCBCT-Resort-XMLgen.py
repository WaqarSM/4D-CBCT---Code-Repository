# This code will read in the *.HIS file, XML file, and the *.SORT.txt file
# It outputs sorted/binned *.HIS and new XML files


import csv
import xml.etree.ElementTree as ET
import numpy as np
import array
import shutil
import os
#------------------File Locations-------------
# Change the hisFileLoc to the location of the *.HIS file Projections

hisFileLoc= '/Users/mwaqar/4DCBCT Project/img_1.3.46.423632.1354522017101323933437.72/'
sortFileLoc = hisFileLoc+'Reconstruction/1.3.46.423632.1354522017101323933437.72.10.13.2017191452671.SCAN.Sort.txt'
xmlFileLoc= hisFileLoc+'_Frames.xml'
sortedFileLoc = hisFileLoc+'sorted'

#------------------Parsing Sort file------------------
with open(sortFileLoc, 'rb') as csvfile:
     csvreader = csv.reader(csvfile, delimiter='\t', quotechar='|')

     sortList=[]

     for i in csvreader:
         sortList+=i[3]
         # print i[3]

     #print counti
     print '-----'
     # print sortList
     sortListInt = [int(x) for x in sortList]
     print sortListInt
     print len(sortListInt)


#------------------Parsing Elekta XML------------------
tree = ET.parse(xmlFileLoc)
root = tree.getroot()
print root.tag
print root.attrib
print "-----"
for child in root:
    print child.tag, child.attrib # print all tags under ProjectionSet
    # for child2 in child:
    #     print child2.tag, child2.attrib
    #     for child3 in child2:
    #         print child3.tag, child3.attrib
    #         for child4 in child3:
    #             print child4.tag, child4.attrib
print "-----"

print root[4][7].tag
print root[4][7].text # perfix of DicomUID Name

suffixName = root[4][7].text
frameXMLItem=root.findall('Frames/Frame')

ET.dump(frameXMLItem[0])
print"__________________"

for item in frameXMLItem:
    print item.find('Seq')
    print item.find('Seq').text

# ----------------Making new directories for sorted files and Copying *.HIS files to new directories -----------

print "--Nameing---"
fileNameInt = range(1,len(sortListInt)+1) #making a seq. array for the number of files
print fileNameInt
print len(fileNameInt)

fileNameZintl = [0] * len(fileNameInt) #Making empty array size = #of files
for i in fileNameInt:
    fileNameZintl[i-1] = str(fileNameInt[i-1]).zfill(5)+'.'+suffixName+'.his' #adding the 0000 perfix to the same
print fileNameZintl
print len(fileNameZintl)

print "--Moving---"
if not os.path.exists(sortedFileLoc):
    os.makedirs(sortedFileLoc)
else:
    print "dir already exists at "+sortedFileLoc

pathIndex=range(0,10)
for i in pathIndex:
    if not os.path.exists(sortedFileLoc+"/"+str(i)):
        os.makedirs(sortedFileLoc+"/"+str(i))
    else:
        print "dir already exists at /sorted/"+str(i)

HisFileFromLoc = [0] * len(sortListInt)
for i in range(0,len(sortListInt)):
    print i
    movedLoc=sortedFileLoc+"/"+str(sortListInt[i])+"/"+fileNameZintl[i]
    print movedLoc
    HisFileFromLoc[i]=hisFileLoc+fileNameZintl[i]
    print HisFileFromLoc[i]
    print "-"
    shutil.copyfile(HisFileFromLoc[i], movedLoc)


#------------Making sorted XML file ------------------
stationInfo=root.find('Station')
patientInfo=root.find('Patient')
treatmentInfo=root.find('Treatment')
fieldInfo=root.find('Field')
imageInfo=root.find('Image')
FrameInfoList=root.findall('Frames/Frame')
ET.dump(FrameInfoList[0])

# ProjectionSetSortList = ET.Element('ProjectionSet')
# ProjectionSetSortList.append(stationInfo)
# ProjectionSetSortList.append(patientInfo)
# ProjectionSetSortList.append(treatmentInfo)
# ProjectionSetSortList.append(fieldInfo)
# ProjectionSetSortList.append(imageInfo)

ProjectionSetSortList=[0]*10
for i in range(0,10):
    ProjectionSetSortList[i] ='ProjectionSetSort'+str(i)
    print ProjectionSetSortList[i]
    ProjectionSetSortList[i] = ET.Element('ProjectionSet')
    ProjectionSetSortList[i].append(stationInfo)
    ProjectionSetSortList[i].append(patientInfo)
    ProjectionSetSortList[i].append(treatmentInfo)
    ProjectionSetSortList[i].append(fieldInfo)
    ProjectionSetSortList[i].append(imageInfo)
    framesInfo=ET.SubElement(ProjectionSetSortList[i], 'Frames')
    # ProjectionSetSortList[i].append(framesInfo)
    myXMLdataPYloop =ET.tostring(ProjectionSetSortList[i])
    myXMLfile = open(sortedFileLoc+"/"+str(i)+"/"+"_Frames.xml", "w")
    myXMLfile.write(myXMLdataPYloop)

for i in range(0,len(sortListInt)):
    print i
    ProjectionSetSortList[sortListInt[i]].find('Frames').append(FrameInfoList[i])
    ProjectionSetSortList[sortListInt[i]].append(FrameInfoList[i])
    myXMLdataPYloop =ET.tostring(ProjectionSetSortList[sortListInt[i]])
    #myXMLfile = open(sortedFileLoc+"/"+str(sortListInt[i])+"/"+"_Frames"+str(sortListInt[i])+".xml", "w")
    myXMLfile = open(sortedFileLoc+"/"+str(sortListInt[i])+"/"+"_Frames.xml", "w")
    myXMLfile.write(myXMLdataPYloop)
