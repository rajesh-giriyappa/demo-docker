# Start with a base image containing Java runtime
FROM jdk8:1.8.0

# Add Maintainer Info
LABEL maintainer="rajesh.giriyappa"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/openshift-1.0-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} openshift-1.0-SNAPSHOT.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/openshift-1.0-SNAPSHOT.jar"]
