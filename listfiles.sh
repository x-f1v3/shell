#!/bin/bash
#

function ergodic(){
  for file in `ls $1`
  do
    if [ -d $1"/"$file ]
    then
      ergodic $1"/"$file
    else
      local path=$1"/"$file 
      local name=$file      
      echo $name $path 
    fi
  done
}
IFS=$'\n' #这个必须要，否则会在文件名中有空格时出错

ergodic '/tmp/'
