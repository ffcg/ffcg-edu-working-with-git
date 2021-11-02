#!/bin/bash

fullscriptname="${0##*/}"
folder="${fullscriptname%.*}"

file1=twinkle_twinkle.txt
filepath=../../files

echo
if [ -d $folder ]
then
  echo "+ Delete folder $folder"
  rm -rf ./$folder
fi
echo "+ Create folder $folder and initialize git"
git init -q -b main $folder
echo ""
read -p "+ Check (g)it out. Keypress to continue..." -n1 -s
echo ""
cd $folder
cp $filepath/$file1 .
echo "+ Stage file $file1"
git add $file1
echo "+ Make initial commit"
git commit -qm "Initial commit"
