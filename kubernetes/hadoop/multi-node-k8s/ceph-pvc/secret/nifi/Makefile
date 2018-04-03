create-nifi-conf:
	kubectl create secret generic nifi-config-hadoop-core-site --from-file=../../../../../../conf/nifi/hadoop/core-site.xml  --namespace=cephfs
	kubectl create secret generic nifi-config-hadoop-hdfs-site --from-file=../../../../../../conf/nifi/hadoop/hdfs-site.xml  --namespace=cephfs

delete-nifi-conf:
	- kubectl delete secret nifi-config-hadoop-core-site --namespace=cephfs
	- kubectl delete secret nifi-config-hadoop-hdfs-site --namespace=cephfs
