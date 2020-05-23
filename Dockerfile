#getting base image ubuntu
FROM ubuntu

MAINTAINER Arvind Javali <JavaliReports>

RUN apt-get install python2
RUN pip install virustotal-api-v2

COPY docs/content ${HOME}/content

WORKDIR ${HOME}

CMD {"echo", "Successfully created image"}

