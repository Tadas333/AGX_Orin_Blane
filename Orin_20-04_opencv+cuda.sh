#! /bin/bash

sudo apt install cuda-toolkit-11-4
sudo apt-get install python3-pip
sudo -H pip install -U jetson-stats

sudo apt-get install nano

#git clone https://github.com/Tadas333/VSCODE_FOR_JETSON.git
#cd VSCODE_FOR_JETSON
#./install_VSCODE.sh
git clone https://github.com/jetsonhacks/installVSCode.git
cd installVSCode
./installVSCodeWithPython.sh

#sudo apt dist-upgrade
#sudo reboot
#sudo apt install -y nvidia-jetpack


sudo apt update
sudo apt install -y build-essential cmake git libgtk2.0-dev pkg-config  libswscale-dev libtbb2 libtbb-dev
sudo apt install -y python-dev python3-dev python-numpy python3-numpy
sudo apt install -y curl

sudo apt install -y  libjpeg-dev libpng-dev libtiff-dev libjasper-dev 
sudo apt install -y libavcodec-dev libavformat-dev
sudo apt install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt install -y libv4l-dev v4l-utils qv4l2 v4l2ucp libdc1394-22-dev


curl -L https://github.com/opencv/opencv_contrib/archive/4.5.4.zip -o opencv_contrib-4.5.4.zip

curl -L https://github.com/opencv/opencv/archive/4.5.4.zip -o opencv-4.5.4.zip

unzip opencv-4.5.4.zip 
unzip opencv_contrib-4.5.4.zip 
cd opencv-4.5.4/


mkdir release
cd release/

cmake     -D WITH_CUDA=ON \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.5.4/modules \
        -D WITH_GSTREAMER=ON \
        -D WITH_LIBV4L=ON \
        -D BUILD_opencv_python2=OFF \
        -D BUILD_opencv_python3=ON \
        -D BUILD_TESTS=OFF \
        -D BUILD_PERF_TESTS=OFF \
        -D BUILD_EXAMPLES=OFF \
        -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local ..
        
        
make -j8
sudo make install
