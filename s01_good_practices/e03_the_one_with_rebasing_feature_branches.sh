#!/bin/bash

fullscriptname="${0##*/}"
folder="${fullscriptname%.*}"

file1=twinkle_twinkle.txt
file2=blinka_lilla.txt
file3=readme.txt
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
echo "+ Create empty file $file1, and commit it"
touch $file1
git add $file1
git commit -qm "Initial commit"
cat $filepath/$file1 > ./$file1
git commit -qam "Add lyrics"

echo "+ Add a few commits on main"
for i in {1..5}
do
  echo "add $i line" >> ./$file1
  git commit -qam "add change $i"
done


echo "+ Create branches with a cool extra features"
git branch feature1
git checkout -qb feature2
cp $filepath/$file2 .
git add $file2
git commit -qm "f2: add swedish twinkle"
echo "National anthem material!" >> $file2
git add $file2
git commit -qm "f2: add opinion"
echo "Really awesome song!" >> $file2
git add $file2
git commit -qm "f2: add second opinion"

git checkout -q feature1
touch $file3
echo "This repo is awesome" >> $file3
git add $file3
git commit -qm "f1: add readme"
echo "This repo is really awesome" >> $file3
git add $file3
git commit -qm "f1: improve readme"

sleep 0.5
git checkout -q main
echo "+ Add a few more commits on main"
echo
for i in {6..10}
do
  echo "add $i line" >> ./$file1
  git commit -qam "add change $i"
done
