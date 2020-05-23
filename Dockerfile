#getting base image
FROM ubuntu
MAINTAINER Arvind Javali <JavaliReports>

USER root

RUN apt-get update -qq
RUN apt install python-pip -qq
RUN pip install virustotal-api-v2
  
COPY docs/content ${HOME}/content
WORKDIR ${HOME}

WORKDIR ${HOME}

CMD {"echo", "Successfully created image"}
USER ${USER}
