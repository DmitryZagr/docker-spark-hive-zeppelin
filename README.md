# docker-spark-hive-zeppelin

# New Features!

  - Spark v.2.1.1
  - Hive v.2.2.0
  - Zeppelin v.0.7.2



## Подготовка

#### Собрать базовый образ hadoop 2.8.1
```sh
git clone https://github.com/DmitryZagr/docker-hadoop.git
git checkout al_1.2.1-hadoop2.8.1-java8
make build-local
```
####  Собрать образ hive 2.2.0
```sh
git clone https://github.com/DmitryZagr/docker-hive.git
git checkout hive_2.2.0
make build-local
```
#### Собрать мета хранилище на основе PostgreSQL для Hive 2.2.0
```sh
git clone https://github.com/DmitryZagr/docker-hive-metastore-postgresql.git
git checkout 2.2.0
make build-local
```
####  Собрать образ Spark 2.1.1
```sh
git clone https://github.com/DmitryZagr/docker-spark.git
git checkout al_spark2.2.0-hadoop2.8.1-hive-java8
make build
```

## Запук системы на одной машине
```sh
git clone https://github.com/DmitryZagr/docker-spark-hive-zeppelin.git
docker-compose down && docker-compose up
```
