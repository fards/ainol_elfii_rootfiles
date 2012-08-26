#!/bin/bash

DEFAULT_BRANCH=ics-amlogic-mx0525

echo "***********************************Delete Git Lib*************************************"
rm -rf hardware/amlogic/libcamera
rm -rf external/libskia
rm -rf external/libwebkit


echo "***********************************Clone LibCamera****************************************"
cd hardware/amlogic
git clone git://git-sc.amlogic.com/platform/hardware/amlogic/libcamera
cd libcamera
git checkout -t origin/$DEFAULT_BRANCH
cd  ../../..


echo "***********************************Clone LibSkia******************************************"
cd external
git clone git://git-sc.amlogic.com/platform/external/libskia
cd libskia
git checkout -t origin/$DEFAULT_BRANCH


echo "***********************************Clone LibWebKit****************************************"
cd ..
git clone git://git-sc.amlogic.com/platform/external/libwebkit
cd libwebkit
git checkout -t origin/$DEFAULT_BRANCH
cd ../..


echo "***********************************Delete unused file*************************************"
rm -rf hardware/amlogic/camera
find ./external/webkit -name *.mk | xargs rm -f
rm -rf external/webkit/Source/WebKit/android/jni
rm -rf external/webkit/Source/WebCore/rendering
rm -rf external/webkit/Source/WebCore/platform
rm external/skia/Android.mk
rm -rf external/skia/src/core
rm -rf external/skia/android_sample
rm -rf external/skia/gm
rm -rf external/skia/bench
rm -rf external/skia/tests

echo "***********************************Zip the source  code************************************"
tar -czf mx0525ainole1release.tar.gz ./ --exclude=.git --exclude=.repo --exclude=rootfs/out