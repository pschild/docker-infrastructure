FROM jenkins4eval/jenkins
USER root

RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash
RUN apt-get -y install nodejs python-pip
RUN pip install -U platformio
