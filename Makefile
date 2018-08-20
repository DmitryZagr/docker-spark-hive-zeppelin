build-zeppelin:
	docker build -t dmitryzagr/zeppelin:0.8.0-v1-spark2.2.2-hadoop3.1.1 conf/zeppelin
push-zeppelin:
	docker push dmitryzagr/zeppelin:0.8.0-v1-spark2.2.2-hadoop3.1.1

build-keycloack:
	docker build --no-cache -t dmitryzagr/keycloak-openshift:3.4.0.Final conf/keycloak
push-keycloack:
	docker push dmitryzagr/keycloak-openshift:3.4.0.Final

build-nifi:
	docker build --no-cache -t dmitryzagr/nifi:latest conf/nifi
push-nifi:
	docker push dmitryzagr/nifi:latest
