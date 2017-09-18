# docker-spark-hive-zeppelin

# New Features!

  - Spark v.2.1.1
  - Hive v.2.2.0
  - Zeppelin v.0.7.2



## Подготовка

#### Настроить ноды в соответствии с docker-stack.yml
Необходимо прописать labels

#### Запук системы
```sh
git clone https://github.com/DmitryZagr/docker-spark-hive-zeppelin.git
cd docker-spark-hive-zeppelin
docker stack  deploy -c docker-stack.yml hadoop
```
