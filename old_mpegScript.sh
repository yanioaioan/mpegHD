#! /usr/bin/bash
#title           :mpegScript.sh
#description     :This script is just a temporary workaround for ffmpeg .mp4 conversion of a sequence of frames.
#author		 :Ioannis Ioannidis
#date            :4/12/2015
#version         :1    
#usage		 :./mpegScript.sh
#==============================================================================

echo "give baseTifname --> for ./path/myframe0001.tif give: ./path/myframe"
read baseTifname

echo "give tiffExtension tif or tiff --> for myframe0001.tif give: tif"
read tiffExtension

echo "give padding --> for myframe0001.tif give: 4"
read padding

echo "give output file name: smth.mp4"
read outputfilename


eval "/usr/bin/ffmpeg -y -i \"${baseTifname}%0${padding}d.${tiffExtension}\" -vcodec h264 -r 24000/1001 -s hd1080 -me_method full -sc_threshold 40 -cmp +chroma -partitions +parti4x4+partp8x8+partb8x8 -i_qfactor 0.71 -keyint_min 25 -b_strategy 1 -g 250 -b 6144k -bt 8192k -g 24 -r 25 -f mp4 $outputfilename"

