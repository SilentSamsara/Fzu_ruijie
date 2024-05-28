#!/bin/bash

logger "#########################################Shell Begin##########################################"
logger "$(date "+%Y-%m-%d %H:%M:%S") Execute Check Shell"
echo "#########################################Shell Begin##########################################"
echo "$(date "+%Y-%m-%d %H:%M:%S") Execute Check Shell"

timeStart=$(date +%s)
function verifyNetwork() {
  local target="http://www.baidu.com"
  local target2="http://www.google.com.hk"

  local ua="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0"
  local timeout=2
  response=$(curl -s -A $ua --connect-timeout $timeout $target)
  response2=$(curl -s -A $ua --connect-timeout $timeout $target2)

  if [ -n "$response" ] || [ -n "$response2" ]; then
    authenStr=$(echo ${response} | grep "eportal/index.jsp")
    authenStr2=$(echo ${response} | grep "eportal/index.jsp")
    if [ -n "$authenStr" ] || [ -n "$authenStr2" ]; then
      return 1
    else
      return 0
    fi
  else
    return 1
  fi

}

verifyNetwork
if [ $? == 0 ]; then
  echo "$(date "+%Y-%m-%d %H:%M:%S") No Authentication Required"
  logger "$(date "+%Y-%m-%d %H:%M:%S") No Authentication Required"
else
  echo "$(date "+%Y-%m-%d %H:%M:%S") Require Authentication Network"
  logger "$(date "+%Y-%m-%d %H:%M:%S") Require Authentication Network"
  authOutput="$($* 2>&1)"
  authenStr=$(echo ${authOutput} | grep "success!")
  if [ -n "$authenStr" ]; then
    echo "$(date "+%Y-%m-%d %H:%M:%S") Authentication succeeded!!!!!"
    logger "$(date "+%Y-%m-%d %H:%M:%S") Authentication succeeded!!!!!"
  else
    echo "$(date "+%Y-%m-%d %H:%M:%S") Authentication failed?????"
    logger "$(date "+%Y-%m-%d %H:%M:%S") Authentication failed?????"
  fi
fi

timeEnd=$(date +%s)
take=$(expr $timeEnd - $timeStart)
echo "Shell Execution Time: ${take} s".
echo "################################################################"
logger "Shell Execution Time: ${take} s."
logger "#########################################Shell End############################################"
exit 0
