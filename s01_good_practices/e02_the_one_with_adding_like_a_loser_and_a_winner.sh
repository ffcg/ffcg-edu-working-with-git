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
echo ""
read -p "+ Check (g)it out. Keypress to continue..." -n1 -s
echo ""
cd $folder
cp $filepath/$file1 .
echo "+ Stage file $file1"
git add $file1
echo "+ Make initial commit"
git commit -qm "Initial commit"

echo "+ Make changes to $file1"
sed -b -i '2s/what/who/' $file1
sed -b -i '16s/.*/Thanks you for your tiny car,\r/' $file1
sed -b -i '17s/.*/He does not want to see you anymore,\r/' $file1
sed -b -i '18s/.*/If you did not blinkat so.\r/' $file1
sed -b -i '20s/.*/Yet another change.\r/' $file1
cp $filepath/$file2 .
