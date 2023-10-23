libgatewayworker_u-4.4a.so:
	./bpc-prepare.sh
	$(MAKE) -C ../GatewayWorker libgatwayworker

libgatewayworker:
	bpc -v \
	    -c ../GatewayWorker-bpc.conf \
	    -l gatewayworker \
	    -u workerman \
	    --input-file src.list

install-libgatewayworker:
	cd ../GatewayWorker && bpc -l gatewayworker --install
