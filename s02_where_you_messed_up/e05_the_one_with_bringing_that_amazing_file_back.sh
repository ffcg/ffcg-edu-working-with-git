#!/bin/bash

fullscriptname="${0##*/}"
folder="${fullscriptname%.*}"

file1=twinkle_twinkle.txt
file2=my_personal_pin_code.txt
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
echo "+ Copy files"
cp $filepath/$file1 .
cp $filepath/$file2 .
echo "+ Commit files"
git add $file1 $file2
git commit -qm "initial commit"

echo "+ Update files"
sed -b -i '2s/what/who/' $file1
echo -e "add 1\r" >> $file2
git commit -qam "update 1"
sed -b -i '17s/He/She/' $file1
echo -e "add 2\r" >> $file2
git commit -qam "update 2"
sed -b -i '34s/what/who/' $file1
echo -e "add 3\r" >> $file2
git commit -qam "update 3"