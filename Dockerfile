# Start with a base image containing Java runtime
FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Copy the project files into the working directory
COPY . .

# Grant permissions for the build script to execute
RUN chmod +x ./gradlew

# Run Gradle build
RUN ./gradlew clean build  -no-daemon

# List the contents of the /app/build/libs/ directory
RUN ls -la /app/build/libs/

# Copy the JAR file from the build directory to the /app/build/llibs directory to a new file.
RUN cp /app/build/libs/*SNAPSHOT.jar /app/hello-java.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/hello-java.jar"]