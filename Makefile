build-local:
	docker build -t dmitryzagr/zeppelin:0.7.3 conf/zeppelin
push:
	docker push dmitryzagr/zeppelin:0.7.3