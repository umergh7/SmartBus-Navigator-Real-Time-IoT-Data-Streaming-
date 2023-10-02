#mysql container
docker run -dit --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=debezium -e MYSQL_USER=mysqluser -e MYSQL_PASSWORD=mysqlpw debezium/example-mysql:1.6


#connect to mysql database
docker exec -it '<container_id>' bash
mysql -u root -p 
debezium # root password for MySWQL
CREATE DATABASE demo;

#create ddl

use demo;

CREATE TABLE bus_status (
    record_id INT NOT NULL AUTO_INCREMENT,
    id INT NOT NULL,
    routeId INT NOT NULL,
    directionId VARCHAR(40),
    predictable BOOLEAN,
    secsSinceReport INT NOT NULL,
    kph INT NOT NULL,
    heading INT,
    lat REAL NOT NULL, 
    lon REAL NOT NULL,
    leadingVehicleId INT,
    event_time DATETIME DEFAULT NOW(),
    PRIMARY KEY (record_id)
);

#run nifi container
docker run --name nifi -p 8080:8080 -p 8443:8443 --link mysql:mysql -d apache/nifi:1.12.0

#unzip mysql connector
docker exec -it nifi bash
mkdir custom-jars
cd custom-jars
wget http://java2s.com/Code/JarDownload/mysql/mysql-connector-java-5.1.17-bin.jar.zip
unzip mysql-connector-java-5.1.17-bin.jar.zip


#zookeeper container
docker run -dit --name zookeeper -p 2181:2181 -p 2888:2888 -p 3888:3888 debezium/zookeeper:1.6


# kafka container
docker run -dit --name kafka -p 9092:9092 --link zookeeper:zookeeper debezium/kafka:1.6


# debezium connect container
docker run -dit --name connect -p 8083:8083 -e GROUP_ID=1 -e CONFIG_STORAGE_TOPIC=my-connect-configs -e OFFSET_STORAGE_TOPIC=my-connect-offsets -e STATUS_STORAGE_TOPIC=my_connect_statuses --link zookeeper:zookeeper --link kafka:kafka --link mysql:mysql debezium/connect:1.6














