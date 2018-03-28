FROM apache/zeppelin:0.7.3

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends net-tools curl

ENV HADOOP_VERSION 3.0.1
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*
  
RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
#RUN cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml
RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV HADOOP_PREFIX=$HADOOP_HOME

ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

RUN apt-get update && apt-get install -y libsnappy-dev
RUN ln -s /usr/lib/x86_64-linux-gnu/libsnappy.so /opt/hadoop-$HADOOP_VERSION/lib/native

ADD conf/hadoop/core-site.xml /opt/hadoop-$HADOOP_VERSION/etc/hadoop/core-site.xml

RUN apt-get update \
      && apt-get install -y wget \
      && wget http://apache-mirror.rbc.ru/pub/apache/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz \
      && tar -xvzf spark-2.2.0-bin-hadoop2.7.tgz \
      && mv spark-2.2.0-bin-hadoop2.7 spark \
      && rm spark-2.2.0-bin-hadoop2.7.tgz

ENV SPARK_HOME /zeppelin/spark

RUN rm -r /opt/conda && wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh && \
      /bin/bash Anaconda3-5.1.0-Linux-x86_64.sh -b -p /opt/conda && \
      conda update -y  -n base conda && conda install -y grpcio jupyter && \
      rm Anaconda3-5.1.0-Linux-x86_64.sh

COPY conf/zeppelin-site.xml /zeppelin/conf/zeppelin-site.xml
COPY interpreter.json /zeppelin/conf/interpreter.json
