# Author: Waqar Muhammad - Carleton Physics 2018
# Written in: Bash
# Project Repository: https://github.com/WaqarSM/4DCBCT-Code-Repository
#
# Disclamer: Part of this code was writen by Danny Lessio for the RTK consortium.


if [ ! -d "./RTK-ITK-VTK" ]; then
  #making a directory to host RTK ITK and VTK
  mkdir ITK-RTK
  cd ITK-RTK
  echo ITK-RTK directory made!
fi

if [ ! -d "./VTK" ]; then
  git clone https://github.com/Kitware/VTK.git vtk
  git checkout v7.0.0
  echo VTK directory made, and gitcloned (v7.0.0 cheacked out)
fi

if [! -d ".VTK-bin"]; then
  # Compiling VTK
  mkdir VTK-bin
  cd VTK-binary
  cmake -DModule_vtkGUISupportQt=ON -DModule_vtkGUISupportQtOpenGL=ON -D -DModule_vtkRenderingQt=ON -DModule_vtkViewsQt=ON -DVTK_RENDERING_BACKEND=OpenGL -DVTK_QT_VERSION=5  ../VTK
  make -j4
  path_of_VTK=$(pwd) # Getting the full path of VTK-bin
  cd ..
fi

if [ ! -d "./ITK" ]; then
  git clone git://itk.org/ITK.git
  echo ITK directory made, and gitcloned!
fi


if [ ! -d "./ITK-bin" ]; then
  # Compiling ITK
  mkdir ITK-bin
  cd ITK-bin
  cmake -DModule_ITKReview=ON -DITK_USE_FFTWD=ON -DVTK_DIR=$path_of_VTK -DITK_USE_FFTWF=ON -DBUILD_DOCUMENTATION=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DCMAKE_CXX_FLAGS=-fPIC -DCMAKE_C_FLAGS=-fPIC ../ITK
  make -j4
  path_of_ITK=$(pwd) # Getting the full path of ITK-bin
  cd ..
  echo ITK-bin directory made, and made!
fi

if [ ! -d "./RTK" ]; then
  git clone git://github.com/SimonRit/RTK.git
  echo RTK directory made, and gitcloned!
fi


if [ ! -d "./RTK-bin" ]; then
  # Compiling RTK
  mkdir RTK-bin
  cd RTK-bin

  cmake -DITK_DIR=$path_of_ITK -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=ON -DCMAKE_CXX_FLAGS=-fPIC -DCMAKE_C_FLAGS=-fPIC ../RTK
  make -j4
  echo ITK-bin dic made, and made!
  cd bin
  ./HelloWorld
  cd ..
  cd ..
fi
