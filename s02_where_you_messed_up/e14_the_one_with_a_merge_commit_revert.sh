#!/bin/bash

fullscriptname="${0##*/}"
folder="${fullscriptname%.*}"

remotefolder=$folder-remote.git
file1=twinkle_twinkle.txt
file2=blinka_lilla.txt
filepath=../../files

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
cat $filepath/$file1 > ./$file1
git commit -qam "Add lyrics"

echo "+ Add a few commits on main"
for i in {1..5}
do
  echo -e "add $i line\r" >> ./$file1
  git commit -qam "add change $i"
done


echo "+ Create branch with a cool extra feature"
git checkout -qb feature1
cp $filepath/$file2 .
git add $file2
git commit -qm "f1: add swedish twinkle"

echo -e "National anthem material!\r" >> $file2
git add $file2
git commit -qm "f1: add opinion"

echo -e "Really awesome song!\r" >> $file2
git add $file2
git commit -qm "f1: add second opinion"

echo -e "But is it really that good?\r" >> $file2
git add $file2
git commit -qm "f1: add second thoughts"

echo "+ Create merge feature branch to main"
git checkout -q main
git merge feature1 --no-ff --no-edit -q

sleep 0.5
git checkout -q main
echo "+ Add a few more commits on main"
echo
for i in {6..10}
do
  echo -e "add $i line\r" >> ./$file1
  git commit -qam "add change $i"
done

echo "+ Set up local remote repository"
git clone -q --bare --no-hardlinks . ../$remotefolder
git remote add origin ../$remotefolder
git fetch -q
git branch --set-upstream-to origin/main main
git branch --set-upstream-to origin/feature1 feature1
