build-local:
	docker build -t dmitryzagr/zeppelin:0.8.0-SNAPSHOT-spark2.2.0-hadoop3.0.1 conf/zeppelin
push:
	docker push dmitryzagr/zeppelin:0.8.0-SNAPSHOT-spark2.2.0-hadoop3.0.1