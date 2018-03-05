# This scrip will reconstruction every phase after its been using 4DCBCT-Resort-XMLgen.py
# Inputs:
#  RTKbinLOC - is the location of the RTK Compilied code (ie. it's binary)
#  FileName -  The name of the scan directory
#  FileNum - The short version name of the scan
#
# Output:
#  10 reconstruction (one for each phase) location is set by RtkGeoOutLoc

startTime=$(date +%s)
# Note: Path location can not have any spaces.
FileName=img_1.3.46.423632.1354522017101323295146.75
FileNum=75
Dim=270
Space=1
SpaceZ=1
#php /home/mwaqar/twitter-php/src/tweetcomp.php "Processing new job. Dimension=$Dim,$Dim,$Dim. Job Name= $FileName. "

for (( i=0; i<=9; i++))
	do
		startTimeloop=$(date +%s)
		echo "Number $i"
		echo "Phase being recon $i"
    Phase=$i
    RTKbinLOC=/data/data068/mwaqar/ITK-RTK/RTK-bin/bin/elektaGeometry
    IMGLOC=/data/data068/mwaqar/Sorted_4DCBCT_Data/$FileName/sorted/$Phase
    XMLLOC=/data/data068/mwaqar/Sorted_4DCBCT_Data/$FileName/sorted/$Phase/_Frames.xml
    RtkGeoOutLoc=/data/data068/mwaqar/Sorted_4DCBCT_Data/$FileName/sorted/$Phase/elektaGeometry
    ReconName=$FileNum'_p'$Phase'_full3dRecon_d'$Dim'_s'$Space
    ReconOut=/data/data068/mwaqar/Sorted_4DCBCT_Data/$FileName/sorted/good/$ReconName'spr_24.mha'
    echo 'RTK Bin location: ' $RTKbinLOC
    echo 'Projecttion source: '$IMGLOC
    echo 'XML File location : '$XMLLOC
    echo 'RTK Geo output location: '$RtkGeoOutLoc
    echo 'Recon output location: ' $ReconOut
		echo ' --------------------Now Running RTK Elekta Geometry---------------------------'

		/data/data068/mwaqar/ITK-RTK/RTK-bin/bin/rtkelektasynergygeometry \
			--xml $XMLLOC \
			--verbose \
			-o $RtkGeoOutLoc
		echo ' --------------------Now Running RTK FDK---------------------------------------'
    /data/data068/mwaqar/ITK-RTK/RTK-bin/bin/rtkfdk \
      --lowmem \
      --geometry $RtkGeoOutLoc \
      --path $IMGLOC \
      --regexp '.*.his' \
      --output $ReconOut \
      --verbose \
			--spr=24 \   #scatter to primary
      --spacing $Space,$Space,$SpaceZ \
      --dimension $Dim,$Dim,$Dim
		endTimeloop=$(date +%s)
		TotalTimeloop=$(( $endTimeloop - $startTimeloop ))
#		php /home/mwaqar/twitter-php/src/tweetcomp.php "Elekta Geometry for $FileName (phase:$Phase) is complete. Took $TotalTimeloop Seeconds. It can be accessed at $ReconOut. "
		echo Took $TotalTimloop
	done
#php /home/mwaqar/twitter-php/src/tweetcomp.php "Hey @WaqarM_, Your Elekta Geometry for $FileName is complete. Took $TotalTime Seeconds. End of Job. (See feed for details)"
endTime=$(date +%s)
TotalTime=$(( $endTime - $startTime ))
echo Total Time: $TotalTime





#php /home/mwaqar/twitter-php/src/tweetcomp.php "Hey @WaqarM_, Your Elekta Geometry for $FileName is complete. Took $TotalTime Seeconds. End of Job. (See feed for details)"
