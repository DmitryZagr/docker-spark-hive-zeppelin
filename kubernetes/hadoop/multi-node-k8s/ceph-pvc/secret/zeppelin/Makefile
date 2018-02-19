create-zeppelin-conf:
	kubectl create secret generic zeppelin-conf --from-file=../../../../../../conf/zeppelin/conf/shiro.ini --namespace=cephfs

delete-zeppelin-conf:
	- kubectl delete secret zeppelin-conf --namespace=cephfs
