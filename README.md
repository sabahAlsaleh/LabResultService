
# LabResultService

## Description

LabResultService is an event-based application designed to handle laboratory results. It stores events, manages result entries, and notifies relevant parties of updates.

## Features

- Store and retrieve laboratory results.
- Event-driven architecture for lab result updates.
- Notification service for informing about result changes.

## Technologies Used

- Java
- Spring Boot
- Maven
- Docker
- Kafka
- EventStoreDB

## Installation

To set up the LabResultService, you will need Java and Maven installed on your system. Follow these steps:

1. Clone the repository.
2. Navigate to the terminal.
3. Run `./mvnw package` to build the project.

## Configuration

The application can be run on the KTH cloud or locally by adjusting the `application.properties` file.

### Running on the KTH Cloud (CBHCloud)

For running on the KTH cloud, ensure the following properties are set in `application.properties`:

```properties
# Cloud configurations
spring.kafka.bootstrap-servers=vm.cloud.cbh.kth.se:2558
eventstoredb.connection-string=esdb://vm.cloud.cbh.kth.se:2569?tls=false

eventstoredb.stream.name=LabResultStream
LabResult.topic=labresult-topic
spring.kafka.consumer.group-id=labresultgroup
spring.kafka.consumer.auto-offset-reset=earliest
spring.kafka.consumer.key-deserializer=org.apache.kafka.common.serialization.StringDeserializer
spring.kafka.consumer.value-deserializer=org.springframework.kafka.support.serializer.JsonDeserializer
spring.kafka.consumer.properties.spring.json.trusted.packages=*
spring.kafka.producer.key-serializer=org.apache.kafka.common.serialization.StringSerializer
spring.kafka.producer.value-serializer=org.springframework.kafka.support.serializer.JsonSerializer
```

### Running Locally with Docker Compose

For running locally with Docker Compose, adjust the following configurations:

```properties
server.port:8081
spring.kafka.bootstrap-servers=localhost:9092
eventstoredb.connection-string=esdb://localhost:2113?tls=false

# Common configurations
eventstoredb.stream.name=LabResultStream
LabResult.topic=labresult-topic
spring.kafka.consumer.group-id=labresultgroup
spring.kafka.consumer.auto-offset-reset=earliest
spring.kafka.consumer.key-deserializer=org.apache.kafka.common.serialization.StringDeserializer
spring.kafka.consumer.value-deserializer=org.springframework.kafka.support.serializer.JsonDeserializer
spring.kafka.producer.key-serializer=org.apache.kafka.common.serialization.StringSerializer
spring.kafka.producer.value-serializer=org.springframework.kafka.support.serializer.JsonSerializer
```

## Usage

Once LabResultService is up and running, you can interact with it using the following endpoints:

- **Create a New Lab Result on cloud :**
  To add a new lab result, use the following `POST` request with the appropriate payload:
  ```
  http://labresult.app.cloud.cbh.kth.se/labresult/register
  ```
   ```
  Content-Type: application/json

  {
      "id": "1",
      "patientId": "Sam",
      "result": "Positive"
  }
  ```
- **Retrieve a Lab Result on cloud:**
  To get all lab results, use the following `GET` request:
  ```
  https://labresult.app.cloud.cbh.kth.se/labresult/allevents
  ```
 - **Run a Lab Result locally:**

- **Create a New Lab Result Locally:**
  To add a new lab result, use the following `POST` request with the appropriate payload:
  ```
  http://localhost:8081/labresult/register
  ```
   ```
  Content-Type: application/json

  {
      "id": "1",
      "patientId": "Sam",
      "result": "Positive"
  }
  ```
 - **Retrieve a Lab Result locally:**
  To get all lab results, use the following `GET` request:
   ```
   https://localhost:8081/labresult/allevents
   ```


## Contributing

Current contributors:
- Sabah Alsaleh
- Lowe Lindholm
- Rona Kala
```

