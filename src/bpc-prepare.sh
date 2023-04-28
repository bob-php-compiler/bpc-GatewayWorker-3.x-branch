#!/bin/bash

rm -rf ../GatewayWorker
rsync -a -f"+ */" -f"- *" . ../GatewayWorker

for i in `cat src.list`
do
    filename=`basename -- $i`
    if [ "${filename##*.}" == "php" ]
    then
        echo "phptobpc $i"
        phptobpc $i > ../GatewayWorker/$i
    else
        echo "cp       $i"
        cp $i ../GatewayWorker/$i
    fi
done
cp src.list Makefile ../GatewayWorker/
