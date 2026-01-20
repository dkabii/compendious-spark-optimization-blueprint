FROM eclipse-temurin:11-jre-jammy

ENV SPARK_VERSION=3.5.0

ENV HADOOP_VERSION=3
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

RUN apt-get update && \
    apt-get install -y curl python3 python3-pip && \
    curl -L https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    | tar -xz -C /opt && \
    mv /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} $SPARK_HOME && \
    rm -rf /var/lib/apt/lists/*

COPY start-master.sh /start-master.sh
COPY start-worker.sh /start-worker.sh
RUN chmod +x /start-*.sh

EXPOSE 7077 8080 8081
