#getting base image
#FROM ubuntu
#MAINTAINER Arvind Javali <JavaliReports>

#USER root

#RUN apt-get update -qq
#RUN apt-get install python3-pip -qq
#RUN python3 -m pip install --upgrade pip
#RUN pip install virustotal3
  
#USER ${USER}


FROM cyb3rward0g/jupyter-base:0.0.3

ARG NB_USER
ARG NB_UID
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

USER root

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER} \
    && python3 -m pip install --upgrade attackcti==0.3.1 pandas==0.25.2 
RUN python3 -m pip install virustotal3

COPY docs/content/ ${HOME}

RUN chown -R ${NB_USER}:${NB_USER} ${HOME} ${JUPYTER_DIR}

USER ${NB_USER}

WORKDIR ${HOME}

CMD {"echo", "Successfully created image"}
