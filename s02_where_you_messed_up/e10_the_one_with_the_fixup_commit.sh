#!/bin/bash

fullscriptname="${0##*/}"
folder="${fullscriptname%.*}"

file1=file_that_will_be_fixed.txt
file2=twinkle_twinkle.txt
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
touch $file1

echo "+ Add file $file1"
git add $file1

echo "+ Commit $file1"
git commit -qm "initial commit"

echo -e "line 1\r" >> $file1
echo -e "line 2\r" >> $file1
echo -e "line 3\r" >> $file1
git add $file1
git commit -qm "add lines 1 to 3"

echo "+ Create feature branch"
git checkout -q -b feature1

echo "+ Update file $file1"
echo -e "line 4\r" >> $file1
git commit -qam "update 1"
echo -e "THIS LINE SHOULD BE REMOVED\r" >> $file1
echo -e "line 5\r" >> $file1
git commit -qam "update 2 must be fixed"
cp $filepath/$file2 .
git add $file2
git commit -qm "update 3"
echo -e "line 6\r" >> $file1
git commit -qam "update 4"
