#!/bin/bash

mkdir $1
touch $1/.gitignore

git init $1/

if [[ $(gh auth status | grep Logged) ]];then
    gh repo create "$1" --public --add-readme 
else
    gh auth login
    gh repo create "$1" --public --add-readme
    
fi

hubName=gh repo view $1 | grep -oP 'name:\s\K\w+'

cd $1
git remote add origin git@github.com:$hubName/$1.git 

echo "Done!"
