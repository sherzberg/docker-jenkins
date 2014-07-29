FROM stackbrew/ubuntu:14.04
MAINTAINER Allan Espinosa "allan.espinosa@outlook.com"

WORKDIR /opt

RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless curl && apt-get clean
ADD http://mirrors.jenkins-ci.org/war/1.574/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

ADD entrypoint /opt/entrypoint
ENTRYPOINT ["/opt/entrypoint"]

EXPOSE 8080
CMD ["start"]
