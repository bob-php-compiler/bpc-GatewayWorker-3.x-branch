#!/bin/bash

SRC_LIST="start.php autoload.inc Applications/GatewayProtocol.php Applications/YourApp/start_register.php Applications/YourApp/start_gateway.php Applications/YourApp/start_businessworker.php Applications/YourApp/Events.php"

LIBDIR=`pwd`/../GatewayWorker

rm -rf ./build
rsync -a -f"+ */" -f"- *" . ./build

for i in $SRC_LIST
do
    echo "prepare $i"
    phptobpc $i > ./build/$i
done

cd ./build

bpc -v \
    --static \
    -c ../../GatewayWorker-bpc.conf \
    -L $LIBDIR \
    -u workerman \
    -u gatewayworker \
    -d max_execution_time=-1 \
    -d display_errors=on \
    -d date.timezone=Asia/Shanghai \
    -d memory_limit=512M \
    $SRC_LIST
