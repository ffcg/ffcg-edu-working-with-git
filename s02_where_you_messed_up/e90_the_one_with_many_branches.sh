#!/bin/bash

fullscriptname="${0##*/}"
folder="${fullscriptname%.*}"

remotefolder=$folder-remote.git
file1=file1.txt
file2=file2.txt
file3=file3.txt
file4=file4.txt
filepath=../../files
maincommit=0

echo
if [ -d ./$folder ]
then
  echo "+ Delete folder $folder"
  rm -rf ./$folder
fi
if [ -d ./$remotefolder ]
then
  echo "+ Delete folder $remotefolder"
  rm -rf ./$remotefolder
fi

echo "+ Create folder $folder and initialize git"
git init -q -b main $folder
cd $folder
echo "+ Create empty file $file1, and commit it"
touch $file1
git add $file1
git commit -qm "Initial commit"
echo -e "add line $((maincommit++))\r" >> ./$file1
git commit -qam "add change $maincommit"

echo "+ Add a few commits on main"
for i in {1..2}
do
  echo -e "add line $((maincommit++))\r" >> ./$file1
  git commit -qam "add change $maincommit"
done

echo "+ Create branch 1 with a cool extra features"
git checkout -qb feature1
touch $file2
git add $file2
git commit -qm "f1: add $file2"
echo -e "add line 1\r" >> $file2
git add $file2
git commit -qm "f1: add change 1"
echo -e "add line 2\r" >> $file2
git add $file2
git commit -qm "f1: add change 2"

echo "+ Add a few commits on main"
git checkout -q main
echo -e "add line $((maincommit++))\r" >> ./$file1
git commit -qam "add change $maincommit"
echo -e "add line $((maincommit++))\r" >> ./$file1
git commit -qam "add change $maincommit"

echo "+ Create branch 2 with a cool extra features"
git checkout -qb feature2
touch $file3
echo -e "add line 1\r" >> $file3
git add $file3
git commit -qm "f2: add file"
echo -e "add line 2\r" >> $file3
git add $file3
git commit -qm "f2: add change 1"

echo "+ Add a few commits on main"
git checkout -q main
echo -e "add line $((maincommit++))\r" >> ./$file1
git commit -qam "add change $maincommit"
echo -e "add line $((maincommit++))\r" >> ./$file1
git commit -qam "add change $maincommit"

echo "+ Create branch 3 with a cool extra features"
git checkout -qb feature3
touch $file4
echo -e "add line 1\r" >> $file4
git add $file4
git commit -qm "f3: add file"
echo -e "add line 2\r" >> $file4
git add $file4
git commit -qm "f3: add change 1"

sleep 1
git checkout -q main
echo "+ Add a few more commits on main"
echo
for i in {1..3}
do
  echo -e "add line $((maincommit++))\r" >> ./$file1
  git commit -qam "add change $maincommit"
done

echo "+ Set up local remote repository"
git clone --bare --no-hardlinks . ../$remotefolder
git remote add origin ../$remotefolder
git fetch
git branch --set-upstream-to origin/main main
git branch --set-upstream-to origin/feature1 feature1
git branch --set-upstream-to origin/feature2 feature2
git branch --set-upstream-to origin/feature3 feature3
