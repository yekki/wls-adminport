#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "usage: $0 v1/v2"
    exit -1
fi

VER=$1

source ./common.sh

cd $APPS_HOME

if [[ $VER == "v1" ]]
then
    ${JAVA_HOME}/bin/java ${JVM_ARGS} weblogic.Deployer -adminurl $ADMIN_URL -user weblogic -password welcome1 -name aussie-tripper-v1 -deploy -remote -upload aussie-tripper-v1.ear
elif [[ $VER == "v2" ]]; then
    ${JAVA_HOME}/bin/java ${JVM_ARGS} weblogic.Deployer -adminurl $ADMIN_URL -user weblogic -password welcome1 -adminmode -name aussie-tripper-v1 -deploy aussie-tripper-v2.ear -upload -remote -appversion v2
else
    echo "unsupported version. $VER"
    exit -1
fi