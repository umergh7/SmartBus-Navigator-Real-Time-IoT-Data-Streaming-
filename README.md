# SmartBus Navigator: Real-Time IoT Data Streaming 

![image](https://github.com/umergh7/SmartBus-Navigator-Real-Time-IoT-Data-Streaming-/assets/117035545/4603bc7d-17dd-44ef-92c5-92a6c3ab2991)



## 1. Create an EC2 instance with the following configurations:
* Ubuntu
* t2.xlarge
* Create or use existing key pair
* Use existing security group

## 2. Create Docker Containers and AWS Artifacts
* Setup Docker containers to run various tools such as MySQL, Nifi, Kafka, Zookeeper and Debezium.

## 3. Setup MySQL Database
* We are able to stream directly from API to Nifi/Kafka but sending the data to a static database allows for better retention in case of data loss. 

## 4. Apache Nifi
![image](https://github.com/umergh7/SmartBus-Navigator-Real-Time-IoT-Data-Streaming-/assets/117035545/6e2aa57d-db4a-49fa-a4b3-f3d3e12e29cd)

## 5. Check if kafka is connected to debezium
*  docker exec -it kafka bash
*  bin/kafka-topics.sh --list --zookeeper zookeeper:2181
*  You should see the following topics: dbhistory.demo, dbserver1, dbserver1.demo.bus_status, my-connect-configs, my-connect-offsets, my_connect_statuses
*  To check if kafka consumer is receiving the changes in the mysql database, enter "bin/kafka-console-consumer.sh --topic dbserver1.demo.bus_status --bootstrap-server '{kafka container_id}':9092"
*  You should see json data come out

## 6. Execute Streaming Script in Pyspark
* In the main folder, run "chmod +x *.sh" so that the shell scripts are executable
* Run execute_pyspark.sh

## 7. Visualizations
* Create your visualizations on PowerBI
* Areas to highlight: Average speed per bus, Number of buses running per hour, Map of the traffic patterns, etc.

