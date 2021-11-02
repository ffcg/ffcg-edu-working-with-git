#!/bin/bash

fullscriptname="${0##*/}"
folder="${fullscriptname%.*}"

filepath=../../files
file1=index.html
file2=wally.png
file3=find_my_bug.sh

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
cp $filepath/$file2 .
cp $filepath/$file3 .
echo "+ Add files"
git add $file1 $file2
echo "+ Commit files"
git commit -qm "initial commit"

# echo -e "\r" >> ./$file1
sed -b -i 's/Initial commit/Commit 1/' $file1
git commit -qam "commit 1"
# echo -e "\r" >> ./$file1
sed -b -i 's/Commit 1/Commit 2/' $file1
git commit -qam "commit 2"
# echo -e "\r" >> ./$file1
sed -b -i 's/Commit 2/Commit 3/' $file1
git commit -qam "commit 3"
rm ./$file2
sed -b -i 's/Commit 3/Bad commit/' $file1
git commit -qam "bad commit"
# echo -e "\r" >> ./$file1
sed -b -i 's/Bad commit/Commit 5/' $file1
git commit -qam "commit 5"
# echo -e "\r" >> ./$file1
sed -b -i 's/Commit 5/Commit 6/' $file1
git commit -qam "commit 6"
# echo -e "\r" >> ./$file1
sed -b -i 's/Commit 6/Commit 7/' $file1
git commit -qam "commit 7"
echo -e "\r" >> ./$file1
sed -b -i 's/Commit 7/Commit 8/' $file1
git commit -qam "commit 8"
# echo -e "\r" >> ./$file1
sed -b -i 's/Commit 8/Commit 9/' $file1
git commit -qam "commit 9"
# echo -e "\r" >> ./$file1
sed -b -i 's/Commit 9/Commit 10/' $file1
git commit -qam "commit 10"
