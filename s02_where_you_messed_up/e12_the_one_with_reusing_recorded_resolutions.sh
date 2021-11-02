#!/bin/bash

fullscriptname="${0##*/}"
folder="${fullscriptname%.*}"

file1=file1.txt
file2=file2.txt
file3=file3.txt

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
#touch $file2
#touch $file3
echo "+ Add files"
git add $file1
#git add $file1 $file2 $file3
echo "+ Commit files"
git commit -qm "initial commit"

echo "+ Creating feature branch"
git branch -q feature

echo "+ Adding stuff on files in both branches"
echo -e "add line 1 to $file1\r" >> ./$file1
git commit -qam "add change 1"
#echo -e "add line 1 to $file2\r" >> ./$file2
#git commit -qam "add change 2"
#echo -e "add line 1 to $file3\r" >> ./$file3
#git commit -qam "add change 3"
git branch -q qa_branch
git checkout -q qa_branch
touch $file2
git add $file2
git commit -qm "add file 2"

git checkout -q feature
echo -e "add feature line 1 to $file1\r" >> ./$file1
git commit -qam "add feature change 1"
#echo -e "add feature line 1 to $file2\r" >> ./$file2
#git commit -qam "add feature change 2"
#echo -e "add feature line 1 to $file3\r" >> ./$file3
#git commit -qam "add feature change 3"

git checkout -q main