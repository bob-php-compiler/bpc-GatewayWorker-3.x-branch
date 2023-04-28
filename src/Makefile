libgatwayworker_u-4.4a.so:
	./bpc-prepare.sh
	$(MAKE) -C ../GatewayWorker libgatwayworker

libgatwayworker:
	bpc -v \
	    -c ../GatewayWorker-bpc.conf \
	    -l gatewayworker \
	    -u workerman \
	    --input-file src.list
