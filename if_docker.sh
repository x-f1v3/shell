#/bin/bash


docker_name="bertramchan/mt"



result=$(docker ps  | wc -l )

while true 
do
result=$(docker ps  | wc -l )

if [ $result  -gt  1  ];then

echo "docker is running $(date)"  >> log.txt ;

else 

echo "docker stopped now starting docker  $(date)"  >> log.txt;
docker run  -d -p  80:80 $docker_name;
echo " docker  started $(date)" >> log.txt ;


fi

sleep 40

done
