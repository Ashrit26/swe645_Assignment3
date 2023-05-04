FROM ubuntu
RUN apt-get update && apt-get install -y openjdk-17-jdk && apt-get install -y unzip
RUN mkdir test

COPY swe645project3.war /test
RUN unzip test/swe645project3.war
CMD ["bash"]

CMD ["/usr/bin/java", "-jar", "/target/swe645_Assignment3-0.0.1-SNAPSHOT.jar"]



EXPOSE 8080