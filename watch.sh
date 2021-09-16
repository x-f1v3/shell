#!/bin/bash


now_time=$(date -u -d "+8 hour" +'%Y-%m-%d %H:%M:%S')

# 获取域名

hostnamelist=$(hostname)

# 当cpu使用率大于设置的阀值触发报警

cpu_warn="50"

# 当内存仅剩余2048MB时触发报警


mem_warn="2048"

# 每执行一次都会在机器上生成对应的日志

renwole_check_log="/tmp/renwole_check_mem_cpu_disk.log"

# 钉钉报警Token

dingtalk_openapi="https://oapi.dingtalk.com/"

dingtalk_openapi_token=""

# 获取CPU使用率

item_cpu () {
cpu_idle=$(top -b -n 1 | grep Cpu | awk '{print $2}' | cut -f 1 -d ".")

echo "$now_time 当前cpu使用率为 $cpu_idle" >> $renwole_check_log

if [[ "$cpu_idle" -gt "$cpu_warn" ]]; then

curl ''$dingtalk_openapi'/robot/send?access_token='$dingtalk_openapi_token''  -X POST  -H 'Content-Type: application/json'  -d '{"msgtype": "text","text": {"content": "警告:当前机器'$hostnamelist'CPU使用率达到'$cpu_idle'%,请知晓."}}'

else

echo "CPU健康状态正常"

fi

}

# 获取内存消耗情况

item_mem () {

mem_free=$(free -m | grep "Mem" | awk '{print $4+$6}')

echo "$now_time 当前内存剩余空间为 ${mem_free}MB" >> $renwole_check_log

if [[ "$mem_free" -lt "$mem_warn" ]]; then

curl ''$dingtalk_openapi'/robot/send?access_token='$dingtalk_openapi_token'' -X POST -H 'Content-Type: application/json' -d '{"msgtype": "text","text": {"content": "警告:当前机器'$hostnamelist'内存使用'$mem_free'M,请知晓."}}'

else

echo "内存使用率正常,放心使用"

fi

}


item_cpu

item_mem

