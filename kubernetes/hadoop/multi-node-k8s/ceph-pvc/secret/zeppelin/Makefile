create-zeppelin-conf:
	kubectl create secret generic zeppelin-conf-shiro --from-file=../../../../../../conf/zeppelin/conf/shiro.ini  --namespace=cephfs
#	kubectl create secret generic zeppelin-conf-interpreter --from-file=../../../../../../conf/zeppelin/interpreter.json --namespace=cephfs
	kubectl create secret generic zeppelin-conf-site --from-file=../../../../../../conf/zeppelin/conf/zeppelin-site.xml --namespace=cephfs
	kubectl create secret generic zeppelin-log4j-prop --from-file=../../../../../../conf/zeppelin/conf/log4j.properties --namespace=cephfs

delete-zeppelin-conf:
	- kubectl delete secret zeppelin-conf-shiro --namespace=cephfs
#	- kubectl delete secret zeppelin-conf-interpreter --namespace=cephfs
	- kubectl delete secret zeppelin-conf-site --namespace=cephfs
	- kubectl delete secret zeppelin-log4j-prop --namespace=cephfs
