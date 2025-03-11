#!/bin/bash

# Format HDFS jika belum ada
if [ ! -d "/home/hadoop/hadoop_data/hdfs/namenode" ]; then
  $HADOOP_HOME/bin/hdfs namenode -format -force -nonInteractive
fi

# Start SSH (di background, untuk Hadoop)
sudo service ssh start

# Start Hadoop DFS dan YARN
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

# Tetap hidup dengan bash
exec /bin/bash
