build-local:
	docker build -t dmitryzagr/zeppelin:0.7.3-hadoop3.0.0 conf/zeppelin
push:
	docker push dmitryzagr/zeppelin:0.7.3-hadoop3.0.0