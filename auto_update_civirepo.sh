#!/usr/bin/env bash

declare -a files=("<abosulte path of civicrm dir>")
declare -a remote=("upstream")
declare -a names=("civicrm-core")

# get length of an array
arraylength=${#files[@]}

# use for loop to read all values and indexes
for (( i=1; i<${arraylength}+1; i++ ));
do
  cd ${files[$i-1]}
  git fetch ${remote[i-1]} master
  if [[ -n $(git status -uno | grep 'up-to-date with')  ]]; then
     echo "No changes found in "  ${names[i-1]} ". Skip pulling changes. \n"
  else
     echo "Changes found in " ${names[i-1]} ". Pulling changes... \n"
     git pull --rebase ${remote[i-1]} master
  fi

done
