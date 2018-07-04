
# Author: Waqar Muhammad - Carleton Physics 2018
# Project Repository: https://github.com/WaqarSM/4DCBCT-Code-Repository
# Written in: Bash
# This script will reconstruction every phase after its been using 4DCBCT-Resort-XMLgen.py
# Inputs:
#  		RTKbinLOC - is the location of the RTK Compiled code (ie. it's binary)
# 	  FileName -  The name of the scan directory
# 	  FileNum - The short version name of the scan
#
# Output:
# 	 10 reconstruction (one for each phase) location is set by RtkGeoOutLoc

startTime=$(date +%s) #begins Main Timer
# Note: Path location can not have any spaces.
# FileName=img_1.3.46.423632.141000201831603715236.19 #DICOM_ID of directory
FileName=(img_1.3.46.423632.141000201831615721736.29	img_1.3.46.423632.141000201831622024455.38	img_1.3.46.423632.141000201831603715236.19	img_1.3.46.423632.141000201831614516221.27	img_1.3.46.423632.14100020183162549596.32	img_1.3.46.423632.141000201831621414424.35	img_1.3.46.423632.14100020183161187236.21	img_1.3.46.423632.141000201831613550471.24)
FileNum=19 #Reconstruction idintifire
Dim=270 #Dimension in milimeters
Space=1 #Spacing of Voxel
SpaceZ=1 #Z spacing of Voxel
for (( n=2; n<=2; n++))
do
  for (( i=0; i<=0; i++)) #Main Loop - Runs reconstruction on each binned phase
  do
    startTimeloop=$(date +%s) #Timer for Loop
    echo "Phase being reconstructed $i"
    Phase=$i
    RTKbinLOC=/Users/mwaqar/RTK-bin/bin/elektaGeometry #Location of RTK-bin
    IMGLOC=/Users/mwaqar/4DCBCT_Project/Expriment_2_data/${FileName[n]}/sorted/$Phase #Location of Binned *.HIS files
    XMLLOC=/Users/mwaqar/4DCBCT_Project/Expriment_2_data/${FileName[n]}/sorted/$Phase/_Frames.xml # Location of Binned _Frame.XML
    RtkGeoOutLoc=/Users/mwaqar/4DCBCT_Project/Expriment_2_data/${FileName[n]}/sorted/$Phase/elektaGeometry #Location of RTK geometry file
    ReconName='3D_'${FileName[n]}'_p'$Phase'_d'$Dim'_s'$Space'_sZ'$SpaceZ #Name of reconstructed file with Phase, dimension ,and spacing information.
    mkdir /Users/mwaqar/4DCBCT_Project/Expriment_2_recon/${FileName[n]}
    ReconOut=/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/${FileName[n]}/$ReconName'.mha' #Location of reconstruction output
    echo 'RTK Bin location: ' $RTKbinLOC
    echo 'Projection source: '$IMGLOC
    echo 'XML File location : '$XMLLOC
    echo 'RTK Geo output location: '$RtkGeoOutLoc
    echo 'Recon output location: ' $ReconOut

    echo ' --------------------Now Running RTK Elekta Geometry---------------------------'
    /Users/mwaqar/RTK-bin/bin/rtkelektasynergygeometry \
    --xml $XMLLOC \
    --verbose \
    -o $RtkGeoOutLoc
    echo ' --------------------Now Running RTK FDK---------------------------------------'
    /Users/mwaqar/RTK-bin/bin/rtkfdk \
    --lowmem \
    --geometry $RtkGeoOutLoc \
    --path $IMGLOC \
    --regexp '.*.his' \
    --output $ReconOut \
    --verbose \
    --spr=0.24 \
    --hann=0.8 \
    --scale=60096.15385\
    --shift=0\
    --spacing $Space,$Space,$SpaceZ \
    --dimension $Dim,$Dim,$Dim
    endTimeloop=$(date +%s) #Loop Timer
    TotalTimeloop=$(( $endTimeloop - $startTimeloop )) #Loop Timer
    echo Took $TotalTimeloop
  done
done
endTime=$(date +%s) #Main Timer
TotalTime=$(( $endTime - $startTime )) #Main Timer
echo Total Time: $TotalTime

#php /home/mwaqar/twitter-php/src/tweetcomp.php "Hey @WaqarM_, Your Elekta Geometry for $FileName is complete. Took $TotalTime Seeconds. End of Job. (See feed for details)"
