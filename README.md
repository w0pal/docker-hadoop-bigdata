# Hadoop Pseudo-Distributed Docker

This repository provides a pre-configured Docker environment to run Apache Hadoop 3.3.6 in **pseudo-distributed mode** on Ubuntu 20.04.

**The image now available on [Docker Hub](https://hub.docker.com/repository/docker/w0pal/hadoop-custom)**

## ⚙️ Features

- Hadoop 3.3.6 pre-installed
- SSH ready for Hadoop commands
- Automatically formats HDFS and starts NameNode, DataNode, ResourceManager, and NodeManager on container start

### Build the Docker image

Replace `<your-image-name>` with any name you prefer:

```bash
docker build -t <your-image-name> .
```

### Run the container

```bash
docker run -it --name <your-container-name> -p 9870:9870 -p 8088:8088 <your-image-name>
```

### Access Web Interface

- HDFS NameNode UI: http://localhost:9870
- YARN ResourceManager UI: http://localhost:8088

### Default User

- Username

```bash
hadoop
```

- Password

```bash
hadoop
```

## DataNode Not Running as default

You can delete and chmod the datanode directory:

```bash
rm -r /path/to/datanode
sudo chmod 755 /path/to/datanode
stop-all.sh
start-all.sh
```

## Running MapReduce Job

See [mapreduce.md](mapreduce.md) for more!

### Rerun Container

If the container has been stopped and restarted, you will need to manually start the services again.
See [rerun.md](rerun.md) for step-by-step instructions.
