#!/bin/bash

#用法:bash <(curl -s -L https://zhuzc.cn1.utools.club/quickLogEx.sh)    PS:需要遵循通用日志格式规范
searchkeyWord=queryProduct
searchkeyWord=dataAccess

clear && cd ~

echo "------------------------------------------------------------linux common shell utils------------------------------------------------------------------------"

appDirList=$(ps -ef | grep java | awk -F "logging.dir=" '{print $2}' | awk '{print $1}')
echo "------------------------------------------------------------------------------------------------------------------------------------------------------------"

echo "clear && cd ~"
echo "ps -ef | grep java"
echo "grep -rn  'FinishServiceBeanExprot' / 2>&1 | grep -v 'grep: '"
echo "find / -name 'tomcat_server.conf'  2>&1 | grep -v 'Permission denied'"


for appDir in $appDirList
    do
    #echo "------------------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------------------------------------------------------------------------------------"
    #echo "------------------------------------------------------------------------------------------------------------------------------------------------------------"
    #echo "$(ps -ef | grep java | grep $appDir)"
    #echo "------------------------------------------------------------------------------------------------------------------------------------------------------------"

    PIDList=$(ps -ef | grep java | grep $appDir | awk '{print $2}')

    for PID in $PIDList
        do
        PIDStr=($PID)
    done

    logFileList=`ls -l $appDir | grep '.log' | awk '{print $9}'`

    for logFile in $logFileList
        do
        logFileStr=$logFile
    done
    echo $appDir

	#cat /data/logs/xyy-saas-yzh-web/xyy-saas-yzh-web.20210430.log |grep -o "\-\-\- \[.*\] " |tail -n 5
    logLastThreadList=`cat $appDir/${logFileStr} |grep "\-\-\- \[.*\] " |tail -n 2`
	#echo `cat $appDir/${logFileStr} |grep "\-\-\- \[.*\] " |tail -n 2`
	#for循环默认以空格、换行符为分隔符，  IFS=$'\n'指定分隔符为换行符。  ${logLastThread:0:16}提取子字符串
    IFS=$'\n'
	for logLastThread in $logLastThreadList
		do
		logLastThreadSpecMsg=`echo $logLastThread | grep -o "\-\-\- \[.*\] " |grep -o "\[.*\]"`
		#转义字符串
		logLastThreadSpecMsg=${logLastThreadSpecMsg//\[/\\[}
		logLastThreadSpecMsg=${logLastThreadSpecMsg//\]/\\]}
		logLastThreadSpecMsg=${logLastThreadSpecMsg//\-/\\-}
        echo "cat $appDir/${logFileStr} |grep '$searchkeyWord'  |grep '${logLastThreadSpecMsg}' |grep '${logLastThread:0:16}' "
    done

    #echo "'kill -9 ${PIDStr[0]}'"
    echo "netstat -ano | grep ${PIDStr[0]}"
    echo "cd $appDir"
    echo "ps -ef | grep java | grep $appDir"
    echo "tail -f $appDir/${logFileStr}"
    echo "tail -n 200 $appDir/${logFileStr}"
    echo "vim $appDir/${logFileStr}"
    echo "cat $appDir/${logFileStr} | grep "
    echo "cat $appDir/${logFileStr} | grep -C 1 "
    echo "cat $appDir/${logFileStr} | grep 'pool-16-thread-8' |grep '2021-04-30 11:4[7-8]'"
    echo "cat $appDir/${logFileStr} | grep 'FinishServiceBeanExprot' |grep -o '--- \[.*\]'"
    echo "cat $appDir/${logFileStr} | grep 'threadid' | grep 'time'"
    echo "grep -rn  'FinishServiceBeanExprot' / 2>&1 | grep -v 'grep: ' | grep '$appDir' | sort -n -r "
    echo "cat $appDir/${logFileStr} | grep 'FinishServiceBeanExprot'"

    echo "cat $appDir/${logFileStr} | grep 'pool-16-thread-8' |grep '2021-04-30 11:4[7-8]'"
	echo "filterStr='$searchkeyWord' && cat $appDir/${logFileStr} | grep $""filterStr | tail -n 1 | awk '{print \"cat $appDir/${logFileStr} | grep \" substr($ 6,2, length($ 6) - 2) \" | grep \"  $ 1 \" | grep \" substr($ 2,0, length($ 2) - 4)}' | sh"
done
echo "------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "bash <(curl -s -L https://arthas.aliyun.com/install.sh)"
echo "------------------------------------------------------------------------------------------------------------------------------------------------------------"
