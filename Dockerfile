#getting base image
FROM ubuntu
MAINTAINER Arvind Javali <JavaliReports>

USER root

RUN apt-get update -qq
RUN apt-get install python3-pip -qq
RUN python3 -m pip install --upgrade pip
RUN pip install virustotal3
  
COPY docs/content ${HOME}

USER ${USER}

CMD {"echo", "Successfully created image"}
