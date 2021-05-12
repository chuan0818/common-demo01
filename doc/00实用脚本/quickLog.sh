#!/bin/bash

#用法:bash <(curl -s -L https://zhuzc.cn1.utools.club/quickLog.sh)    PS:需要遵循通用日志格式规范

#appNameList=$(ps -ef | grep java | awk -F "-Djetty.logging.dir=/data/logs/" '{print $2}' | grep "java.io.tmp" | awk '{print $1}')
#echo "------------------------------------------------------------------------------------------------------------------------------------------------------------"
#echo "clear && cd ~"
#echo "ps -ef | grep java"
#for appName in $appNameList
#do
#echo "------------------------------------------------------------------------------------------------------------------------------------------------------------"$appName
#echo "cd /data/logs/$appName && ll"
#echo "tail -f /data/logs/$appName/$appName.$(date +%Y%m%d).log"
#echo "vim /data/logs/$appName/$appName.$(date +%Y%m%d).log"
#echo "cat /data/logs/$appName/$appName.$(date +%Y%m%d).log | grep 'FinishServiceBeanExprot'"
#echo "tail -n 100 /data/logs/$appName/$appName.$(date +%Y%m%d).log"
#echo "tail -100f /data/logs/$appName/$appName.$(date +%Y%m%d).log"


appNameList=$(ps -ef | grep java | awk -F "-Djetty.logging.dir=/data/logs/" '{print $2}' | grep "java.io.tmp" | awk '{print $1}')
echo "------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "clear && cd ~"
echo "ps -ef | grep java"

for appName in $appNameList
do
    echo "------------------------------------------------------------------------------------------------------------------------------------------------------------"$appName

    logFileList=`ls -l /data/logs/$appName|grep ".log"|awk '{print $9}'`
    logFileStr=""
    for logFile in $logFileList
    do
        logFileStr=$logFile
    done

    echo "tail -f /data/logs/$appName/${logFileStr}"
    echo "vim /data/logs/$appName/${logFileStr}"
    echo "cat /data/logs/$appName/${logFileStr} | grep 'FinishServiceBeanExprot'"
    echo "tail -n 100 /data/logs/$appName/${logFileStr}"
done
