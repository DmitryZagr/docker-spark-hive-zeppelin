# docker-spark-hive-zeppelin

# New Features!

  - Spark v.2.1.1
  - Hive v.2.2.0
  - Zeppelin v.0.7.2



## Подготовка

### Настроить ноды в соответствии с docker-stack.yml
#### Пример создания lables

```sh
docker node update --label-add disk=ssd <host-id>
docker node update --label-add disk.type=hive-metastore <host-id>
```

#### Пример использования lables в stack файле
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


#### Запук системы
```sh
git clone https://github.com/DmitryZagr/docker-spark-hive-zeppelin.git
cd docker-spark-hive-zeppelin
docker stack  deploy -c docker-stack.yml hadoop
```
