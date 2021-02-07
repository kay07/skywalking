FROM openjdk:8-jdk-alpine
COPY target/system_platform-0.0.1-SNAPSHOT.jar system_platform-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-javaagent:/tmp/agent/skywalking-agent.jar","-Dskywalking.agent.service_name=system", "-Dskywalking.collector.backend_service=oap.skywalking:11800","-jar","/system_platform-0.0.1-SNAPSHOT.jar"]
