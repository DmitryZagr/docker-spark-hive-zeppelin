build-local:
	docker build -t dmitryzagr/zeppelin:0.8.0-SNAPSHOT conf/zeppelin
push:
	docker push dmitryzagr/zeppelin:0.8.0-SNAPSHOT