# docker-spark-hive-zeppelin

## Components

  - Spark v.2.2.1
  - Hive v.2.3.2
  - Zeppelin v.0.7.3
  - Hadoop 3.0.0
  - Traefik 1.5.2

## Supported infrastructures
  - Kubernetes(k8s) support
  - docker-compose
  - Docker Swarm(not tested long time)

## Kubernetes(k8s)

You can find single node exampe without persistent volumes in **kubernetes/hadoop/singlenode-k8s/without-pvc**.

You can find single Node example in **kubernetes/hadoop/singlenode-k8s/ceph-pvc** with persistent storage based on [CephFS](https://ceph.com/).

You can find multi Node example in **kubernetes/hadoop/multi-node-k8s/ceph-pvc** with persistent storage based on [CephFS](https://ceph.com/).

### Prerequisite

#### K8S
Deploy k8s cluster with **[flannel](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/)** pod network

#### DNS
If you have your own DNS server then add it to **kubernetes/hadoop/dns/hadoop-dns-config.yaml** file.
Deploy external DNS servers to cluser.
```sh
kubectl create -f kubernetes/hadoop/dns/hadoop-dns-config.yaml
```

#### Proxy
Setup proxy to access k8s hadoop components
```sh
cd kubernetes/proxy/conf
make create-traefik-conf
cd ..
kubectl create -f k8s-ingress-traefik.yaml
```
After installing cluster you can access to Apache Zeppelin with url **/zeppelin** on port 80 or 443. You can find spark dashboard on root url /. Also you can see traefik dashboard on port 8080.

#### Ceph
You can find information about setup ceph cluster [here](https://github.com/DmitryZagr/k8s-ceph#k8s-ceph)

#### Kubernetes + CephFS
You can find information [here](https://github.com/DmitryZagr/k8s-ceph#cephfs--statefulsetk8s-api)

### Deploy hadoop on CephFS
```sh
cd kubernetes/hadoop/stateful-set-ceph
kubectl create -f hadoop-env.yaml -f hadoop-kubernetes.yaml
```

### Destroy hadoop cluster
```sh
cd kubernetes/hadoop/stateful-set-ceph
kubectl delete -f hadoop-env.yaml -f hadoop-kubernetes.yaml
```

****

## Local setup
### Prerequisite
Install [docker-compose](https://docs.docker.com/compose/install/)

### Deploy hadoop on single node
```sh
# From repo root dir
docker-compose down && docker-compose up
```


****

## Docker Swarm(not supported)

### Подготовка

#### Настроить ноды в соответствии с docker-stack.yml
##### Пример создания lables

```sh
docker node update --label-add disk=ssd <host-id>
docker node update --label-add disk.type=hive-metastore <host-id>
```

##### Пример использования lables в stack файле
Обратите внимание на секцию constraints
```sh
  hive-metastore-postgresql:
    image: dmitryzagr/hive-metastore-postgresql:2.2.0-hadoop2.8.1-java8
    hostname: hive-metastore-postgresql
    volumes:
      - hive-metastore-postgresql_data:/var/lib/postgresql/data
    deploy:
      placement:
        constraints: 
          - node.role == worker
          - node.labels.disk == ssd
          - node.labels.disk.type == hive-metastore
```

##### Запук системы

 Запуск hadoop кластера
```sh
git clone https://github.com/DmitryZagr/docker-spark-hive-zeppelin.git
cd docker-spark-hive-zeppelin
docker stack  deploy -c docker-stack.yml hadoop
```

Запуск сервисов мониторинга 
```sh
docker stack  deploy -c docker-stack-monitor.yml monitor
```

##### Взаимодействие с системой
Zeppelin Notebook находится на /zeppelin.
Система при первом запуске сгенерит сертификат для обеспечения работы по HTTPS протоколу. Этот сертификат необходимо принять. Весь HTTP трафик будет перенаправлен на HTTPS порт. Во внешний мир можно выставить как 80, так и 443 порт.

## Литература
#### Docker
[Развертывание сервисов через *.yml файлы](http://training.play-with-docker.com/traefik-load-balancing/)

[Типы labels в swarm](https://docs.docker.com/engine/reference/commandline/service_create/#specify-service-constraints-constraint)
#### Мониторинг
[Репозиторий](https://github.com/botleg/swarm-monitoring.git)

[Настройка сервисов мониторинга swarm кластера](https://habrahabr.ru/company/southbridge/blog/327670/)
