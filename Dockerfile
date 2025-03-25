FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV HADOOP_VERSION=3.3.6
ENV HADOOP_HOME=/home/hadoop/hadoop
ENV PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH

# Install packages
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    openssh-server \
    wget \
    ssh \
    vim \
    sudo \
    net-tools \
    iputils-ping \
    curl

# Add user hadoop
RUN useradd -ms /bin/bash hadoop && echo "hadoop:hadoop" | chpasswd && adduser hadoop sudo

WORKDIR /home/hadoop

# Setup SSH
RUN mkdir -p /var/run/sshd && \
    mkdir -p /home/hadoop/.ssh && \
    chmod 700 /home/hadoop/.ssh && \
    ssh-keygen -t rsa -P '' -f /home/hadoop/.ssh/id_rsa && \
    cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys && \
    chmod 640 /home/hadoop/.ssh/authorized_keys && \
    chown -R hadoop:hadoop /home/hadoop/.ssh

# Install Hadoop
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar -xvzf hadoop-${HADOOP_VERSION}.tar.gz && \
    mv hadoop-${HADOOP_VERSION} hadoop && \
    rm hadoop-${HADOOP_VERSION}.tar.gz && \
    chown -R hadoop:hadoop /home/hadoop/hadoop

# Copy config
COPY config/ $HADOOP_HOME/etc/hadoop/

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Copy MapReduce scripts
COPY python/mapper.py /home/hadoop/mapper.py
COPY python/reducer.py /home/hadoop/reducer.py

# Make MapReduce scripts executable
RUN chmod +x /home/hadoop/mapper.py /home/hadoop/reducer.py

RUN chown -R hadoop:hadoop /home/hadoop

EXPOSE 9870 8088 22

USER hadoop
ENTRYPOINT ["/entrypoint.sh"]

