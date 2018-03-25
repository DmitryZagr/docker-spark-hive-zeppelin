create-zeppelin-conf:
	kubectl create secret generic zeppelin-conf --from-file=../../../../../../conf/zeppelin/conf/shiro.ini --from-file=../../../../../../conf/zeppelin/interpreter.json --from-file=../../../../../../conf/zeppelin/conf/zeppelin-site.xml --namespace=cephfs

delete-zeppelin-conf:
	- kubectl delete secret zeppelin-conf --namespace=cephfs
