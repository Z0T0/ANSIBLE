#!/bin/bash
#Maintainer: C.H.
#First: 2019/6/3 19:31
#Function: Set History security
# get user login ip address
USER_IP=`who i am |awk -F " " '{print $NF}' | sed -e 's/[()]//g'`
# define history file formate
HISTTIMEFORMATE="${USER_IP}@`whoami` %F %T"
LOGNAME='www.ch.com'
HISTORY_DIR=/var/log/.history
# check dir
if [ ! -d ${HISTORY_DIR} ];then
	mkdir -pv ${HISTORY_DIR}
fi
#check dir
if [ ! -d ${HISTORY_DIR}/${LOGNAME} ];then
	mkdir -p ${HISTORY_DIR}/${LOGNAME}
        chmod 300 ${HISTORY_DIR}/${LOGNAME}
fi
#export environment variables
export HISTFILE=${HISTORY_DIR}/${LOGNAME}/`date +%Y%m%d_%H%M%S`.${USER_IP}.his
export HISTTIMEFORMATE
chmod 600 ${HISTDIR}/${LOGNAME}/*.his 2> /dev/null

