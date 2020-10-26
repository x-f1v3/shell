#!/bin/bash


function ergodic(){ 
  for file in `ls $1`
  do
    if [ -d $1"/"$file ]
    then
      ergodic $1"/"$file
    else
      local path=$1"/"$file 
      local name=$file      
      if [[ $name =~ $suffix ]]; then
        # echo $name 
          check=(`ls $target | grep $name | wc -l`) # 有重名文件替换
          check=${check// /} # 清除空格
         
        if [[ $check -ne 0 ]]; then
          cp $path $target$name'_'$RANDOM$suffix # $RANDOM 内置随机数
        else
          cp $path $target
        fi
        

      fi
    fi
 done
}

IFS=$'\n' #这个必须要，否则会在文件名中有空格时出错


suffix=".jar"
source=""
target=""

ergodic $source 




