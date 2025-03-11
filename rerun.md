# Re-run Hadoop Services in Container

If you have already built and started the container once, and now you're entering the container again (e.g. after restarting it), follow these steps to re-run the services:

### Start SSH

```bash
sudo service ssh start
```

### Start HDFS (NameNode and DataNode)

```bash
start-dfs.sh
```

### Start YARN (ResourceManager and NodeManager)

```bash
start-yarn.sh
```
