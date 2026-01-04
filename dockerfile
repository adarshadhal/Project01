# Base OS
FROM alpine:3.20

# Install dependencies: OpenJDK 21 + wget + tar
RUN apk update && \
    apk add --no-cache openjdk21-jdk wget tar ca-certificates && \
    update-ca-certificates

# Set Java env
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

# Set Tomcat version
ENV TOMCAT_VERSION=10.1.50
ENV CATALINA_HOME=/opt/tomcat
ENV PATH="$CATALINA_HOME/bin:${PATH}"

# Download and install Tomcat
RUN mkdir -p ${CATALINA_HOME} && \
    cd /tmp && \
    wget https://dlcdn.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    mv apache-tomcat-${TOMCAT_VERSION}/* ${CATALINA_HOME}/ && \
    rm -rf apache-tomcat-${TOMCAT_VERSION}*

# Optional: copy your WAR (uncomment and adjust name)

COPY target/firstweb.war ${CATALINA_HOME}/webapps/

# Expose Tomcat port
EXPOSE 8082

# Run Tomcat in foreground
CMD ["catalina.sh", "run"]

