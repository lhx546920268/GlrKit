#!/bin/bash

if [ -d output ]
then
   echo "output文件夹已存在"
else
   mkdir output/
fi

cd output

if [ -d android ]
then
   echo "android文件夹已存在"
else
   mkdir android/
fi

if [ -d ios ]
then
   echo "ios文件夹已存在"
else
   mkdir ios/
fi

if [ -d ios/basic ]
then
echo "ios/basic文件夹已存在"
else
mkdir ios/basic
fi


if [ -d ios/zegoMart ]
then
echo "ios/zegoMart文件夹已存在"
else
mkdir ios/RNDemo
fi


cd ../
rm -rf output/android/*
rm -rf output/ios/basic/*
rm -rf output/ios/RNDemo/*

#react-native bundle --platform android --dev false --entry-file index.js  --bundle-output output/android/bundle.jsbundle --assets-dest output/android/
#react-native bundle --platform ios --dev false --entry-file basics.js  --bundle-output ios/ZegoMart/bundle.jsbundle --assets-dest output/ios/basic/ --config basics_config.js
#echo "ios 基础打包完成"
#react-native bundle --platform ios --dev false --entry-file index.js  --bundle-output ios/zegoMart/zegoMartBundle.jsbundle --assets-dest ios/ZegoMart/ --config business_config.js
#echo "zegoMart 业务打包完成"

react-native bundle --platform ios --dev false --entry-file basics.js  --bundle-output output/ios/basic/bundle.jsbundle --assets-dest output/ios/basic/ --config basics_config.js
echo "ios 基础打包完成"
#react-native bundle --platform ios --dev false --entry-file RNDemo/index.js  --bundle-output output/ios/RNDemo/RNDemoBundle.jsbundle --assets-dest output/ios/RNDemo/ --config business_config.js
#echo "zegoMart 业务打包完成"

#cd output/android
#zip -r -o rn-android_$(date +%Y%m%d%H%M%S).zip bundle.jsbundle drawable-mdpi/
#rm -rf bundle.jsbundle
#rm -rf drawable-*

#rm -rf ../../lastRelease/android/*
#cp rn-android_$(date +%Y%m%d%H%M%S).zip ../../lastRelease/android/rn-android_last_release.zip

#cd ../ios
#zip -r -o rn-ios_$(date +%Y%m%d%H%M%S).zip bundle.jsbundle assets/
#rm -rf bundle.jsbundle
#rm -rf assets
#
#rm -rf ../../lastRelease/ios/*
#cp rn-ios_$(date +%Y%m%d%H%M%S).zip ../../lastRelease/ios/rn-ios_last_release.zip


echo "android ios rn 打包完成"


