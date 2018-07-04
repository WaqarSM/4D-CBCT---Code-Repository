# 4DCBCT-Code-Repository

This is the repository for the 4D Cone Beam CT Image quality and parameter optimizing Project. Carleton University Physics 2018.
Supervisors: A.Elsayed, E.Heath, T.Xu

Sample data can be found at: sftp://tyr.physics.carleton.ca/data/data068/mwaqar/Sample%20Data/img_1.3.46.423632.1354522017101323295146.75%20copy.zip
  The Sample data contains a 4DCBCT Scan of CIRM Dynamic phantom in Cos^4 motion with a phase time of 4 seconds and tumour travel of 20mm.

This project uses tools from the Reconstruction Tool Kit (RTK) consortium. To install it on a Linux based system run Auto-RTK-ITK-VTK-Install.sh
This will also install the Insight Segmentation and Registration Toolkit (ITK) and Visualization Toolkit (VTK)

Before running it assure that the following tools are installed on your system:
* GIT
* CMake
* C/C++ Compiler

To install these on a mac simply run the following spinets in terminal:

```
#installing homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```
#Installing GIT
brew install git
```

```
#Installing CMake
brew install cmake
```
  ___________________________________________________________________________
The code uses CBCT scans from the Elekta XVI v.5 system.
These files should contain the following:
* *.HIS files
  * location: \DICOMID (ie. img_1.3.46.423632.1354522017101323295146.75)
* _FRAMES.XML file
  * location: \DICOMID
* *.SORT.txt file
  * location: \DICOMID\Reconstruction (ie. img_1.3.46.423632.1354522017101323295146.75\Reconstruction)
  ___________________________________________________________________________

The data should be processed in the following order:

* Resorting (binning) using 4DCBCT-Resort-XMLgen.py:

  This code will read in the *.HIS file, XML file, and the *.SORT.txt file.
  It outputs sorted/binned *.HIS and new XML files
* Reconstructing each phase using 4D-Recon-script

    Inputs: Location of the RTK Compiled code (ie. it's binary) and SCAN DICOMID
    Output: 10 reconstruction (one for each phase) location is set by RtkGeoOutLoc
