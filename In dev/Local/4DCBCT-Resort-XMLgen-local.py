# Author: Waqar Muhammad - Carleton Physics 2018
# Project Repository: https://github.com/WaqarSM/4DCBCT-Code-Repository
# Written in: Python (Tested in python 2.7)
#
# This code will read in the *.HIS file, XML file, and the *.SORT.txt file
# It outputs sorted/binned *.HIS and new XML files

#importing libraries
import csv
import xml.etree.ElementTree as ET
import numpy as np
import array
import shutil
import os

#------------------File Locations-------------
#This snipplet sets the location of the original  *HIS files, *.SORT.txt file, *.XML file and output location of binned data

# Change the hisFileLoc to the location of the *.HIS file Projections
hisFileLoc= '/Users/mwaqar/4DCBCT_Project/Expriment_2_data/img_1.3.46.423632.141000201831622024455.38/' #Location of the directories that contains the original *.HIS files - DOES need to be changed
sortFileLoc = hisFileLoc+'Reconstruction/1.3.46.423632.141000201831622024455.38.3.15.2018222024658.SCAN.Sort.txt' #Location of the *Sort.txt file - does not need to be changed
xmlFileLoc= hisFileLoc+'_Frames.xml' #Location of XML file - does not need to be changed
sortedFileLoc = hisFileLoc+'sorted' #Location of binned data output - does not need to be changed.

#------------------Parsing Sort file------------------
#This snipplet Parses the *.SORT.txt file
with open(sortFileLoc, 'rb') as csvfile: #calls open to read (in binary) to parse the *.SORT.txt file
     csvreader = csv.reader(csvfile, delimiter='\t', quotechar='|') #setting parsing parameters, tabs as the delimitation and 'enter' as a new row
     sortList=[] #decalering  array to hold Bin numbers
     for i in csvreader: #For loop to iterate .SORT.txt file and append Bin number to array sortList
         sortList+=i[3]

     print '-----'
     sortListInt = [int(x) for x in sortList]
     print sortListInt
     print 'Length if sort list =', len(sortListInt)

#------------------Parsing Elekta XML------------------
#For contest please seethe Elekta *.XML file
tree = ET.parse(xmlFileLoc)  #Parsing Elekta XML using the xml.etree.ElementTree library as tree
root = tree.getroot()  #Setting first degree tags as root
print root.tag #Printing all the tags in root
print root.attrib #printing attributes of tags in root
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
print root[4][7].text #perfix of DicomUID Name

suffixName = root[4][7].text #suffix of DicomUID Name
frameXMLItem=root.findall('Frames/Frame') #parsing all Frame elements in Frames

ET.dump(frameXMLItem[0]) #Printing Frame number
print"-----"

for item in frameXMLItem:
    print item.find('Seq')
    print item.find('Seq').text

# ----------------Making new directories for sorted files and Copying *.HIS files to new directories -----------
print "--Naming---"
fileNameInt = range(1,len(sortListInt)+1) #making a seq. array for the number of files
print fileNameInt
print len(fileNameInt)

fileNameZintl = [0] * len(fileNameInt) #Making empty array size equal to # of files
for i in fileNameInt:
    fileNameZintl[i-1] = str(fileNameInt[i-1]).zfill(5)+'.'+suffixName+'.his' # Adding the 0000 prefix to the same
#print fileNameZintl
#print len(fileNameZintl)

print "--Moving---"
if not os.path.exists(sortedFileLoc): #checking if sort directories exist if not makes directories
    os.makedirs(sortedFileLoc)
else:
    print "dir already exists at "+sortedFileLoc #else outputs that they exist

pathIndex=range(0,10)
for i in pathIndex:
    if not os.path.exists(sortedFileLoc+"/"+str(i)): #checking if sort directories exist if not makes 10 new directories
        os.makedirs(sortedFileLoc+"/"+str(i))
    else:
        print "dir already exists at /sorted/"+str(i)

HisFileFromLoc = [0] * len(sortListInt) #array to hole *.HIS file names
for i in range(0,len(sortListInt)): #Moving (well making copies of) to bins
    print i
    movedLoc=sortedFileLoc+"/"+str(sortListInt[i])+"/"+fileNameZintl[i] #variable = location of binned *.HIS + *.HIS file name
    print movedLoc
    HisFileFromLoc[i]=hisFileLoc+fileNameZintl[i] #Location on original *.HIS file + name
    print HisFileFromLoc[i]
    print "-"
    shutil.copyfile(HisFileFromLoc[i], movedLoc)  #Making a Copying to *.HIS file to bin directory


#------------Making sorted XML file ------------------
#This spinnet creates XML files for the binned data
stationInfo=root.find('Station') #object holding all Station element info
patientInfo=root.find('Patient') #object holding all Patient element info
treatmentInfo=root.find('Treatment') #object holding all Treatment element info
fieldInfo=root.find('Field') #object holding all Field element info
imageInfo=root.find('Image') #object holding all Image element info
FrameInfoList=root.findall('Frames/Frame') #object holding all Frame tag info (n.b. Frames is not to be confused with Frame; there are many frame elements and they are sub-elements of Frames )
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
    ProjectionSetSortList[i] = ET.Element('ProjectionSet') #making a XML main tag called Projection set
    ProjectionSetSortList[i].append(stationInfo) #Appending station element Info
    ProjectionSetSortList[i].append(patientInfo)  #Appending patient element Info
    ProjectionSetSortList[i].append(treatmentInfo) #Appending treatment element Info
    ProjectionSetSortList[i].append(fieldInfo) #Appending field element Info
    ProjectionSetSortList[i].append(imageInfo) #Appending image telementag Info
    framesInfo=ET.SubElement(ProjectionSetSortList[i], 'Frames') #Appending element called Frames to hold binned Frame tags (n.b. Frames is not to be confused with Frame; there are many frame elements and they are sub-elements of Frames )
    # ProjectionSetSortList[i].append(framesInfo)
    myXMLdataPYloop =ET.tostring(ProjectionSetSortList[i]) #prepping data of XML file to be saved
    myXMLfile = open(sortedFileLoc+"/"+str(i)+"/"+"_Frames.xml", "w") #opening new XML files at its sorted location
    myXMLfile.write(myXMLdataPYloop) #writing XML file to new location


for i in range(0,len(sortListInt)):
    print i
    ProjectionSetSortList[sortListInt[i]].find('Frames').append(FrameInfoList[i])  #Finding binned Frame elements to Frames
    ProjectionSetSortList[sortListInt[i]].append(FrameInfoList[i]) #Appending binned Frame file to Frames
    myXMLdataPYloop =ET.tostring(ProjectionSetSortList[sortListInt[i]]) #prepping data of XML file to be saved
    #myXMLfile = open(sortedFileLoc+"/"+str(sortListInt[i])+"/"+"_Frames"+str(sortListInt[i])+".xml", "w")
    myXMLfile = open(sortedFileLoc+"/"+str(sortListInt[i])+"/"+"_Frames.xml", "w")
    myXMLfile.write(myXMLdataPYloop) #writing data to XML file
