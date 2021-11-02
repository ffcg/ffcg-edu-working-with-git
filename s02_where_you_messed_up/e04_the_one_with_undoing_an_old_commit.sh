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
cd $folder
cp $filepath/$file1 .
echo "+ Add file $file1"
git add $file1
echo "+ Commit $file1"
git commit -qm "initial commit"

echo "+ Update file $file1"
sed -b -i '2s/what/who/' $file1
git commit -qam "update 1"
sed -b -i '17s/He/THIS BREAKS IT ALL!!/' $file1
git commit -qam "update 2, that breaks things"
sed -b -i '34s/what/who/' $file1
git commit -qam "update 3"