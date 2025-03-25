## Running MapReduce Job

### Running Input Data

Create a file named input.txt with the following content:

```bash
hello world
hadoop mapreduce dengan python
hello Hadoop
```

Upload the file to HDFS:

```bash
hadoop fs -put input.txt /user/your_username/input/
```

### Run the MapReduce Job

Execute the following command to run the MapReduce job:

```bash
hadoop jar /home/hadoop/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.6.jar \
    -input /user/your_username/input/input.txt \
    -output /user/your_username/output \
    -mapper /home/hadoop/mapper.py \
    -reducer /home/hadoop/reducer.py \
    -file /home/hadoop/mapper.py \
    -file /home/hadoop/reducer.py
```
