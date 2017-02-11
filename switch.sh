#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "usage: $0 v1/v2"
    exit -1
fi

VER=$1

source ./common.sh

cd $APPS_HOME

${JAVA_HOME}/bin/java ${JVM_ARGS} weblogic.Deployer -adminurl $ADMIN_URL -user weblogic -password welcome1 -start -name aussie-tripper-v1 -appversion $VER
