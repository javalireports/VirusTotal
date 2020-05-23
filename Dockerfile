#getting base image
FROM alpine
MAINTAINER Arvind Javali <JavaliReports>
RUN python3 -m pip install virustotal-api-v2
COPY docs/content ${HOME}/content
WORKDIR ${HOME}

WORKDIR ${HOME}

CMD {"echo", "Successfully created image"}
