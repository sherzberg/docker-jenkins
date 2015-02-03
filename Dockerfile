FROM ubuntu:12.04
MAINTAINER Allan Espinosa "allan.espinosa@outlook.com"

WORKDIR /opt

RUN apt-get update -qq && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless curl git-core && apt-get clean
RUN apt-get autoremove

ADD https://get.docker.io/builds/Linux/x86_64/docker-latest /usr/local/bin/docker
RUN chmod +x /usr/local/bin/docker

ADD http://mirrors.jenkins-ci.org/war/1.598/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

ADD entrypoint /opt/entrypoint
ENTRYPOINT ["/opt/entrypoint"]

EXPOSE 8080
CMD ["start"]
