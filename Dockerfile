#getting base image ubuntu
FROM ubuntu
MAINTAINER Arvind Javali <JavaliReports>
#RUN apt-get install python3
#RUN python3 -m pip install virustotal-api-v2
#COPY docs/content ${HOME}/content
#WORKDIR ${HOME}

ARG NB_USER
ARG NB_UID
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}
ENV PATH "$HOME/.local/bin:$PATH"

USER root

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

USER ${NB_USER}

RUN RUN python3 -m pip install openhunt==1.6.7 attackcti==0.3.0 --user virustotal-api-v2==0.8 --user

COPY docs ${HOME}/docs

USER root

#RUN chown ${NB_USER} /usr/local/share/jupyter/kernels/pyspark3/kernel.json \
#    && chown -R ${NB_USER}:${NB_USER} ${HOME} ${JUPYTER_DIR}

WORKDIR ${HOME}

USER ${NB_USER}

CMD {"echo", "Successfully created image"}
