FROM openjdk:8-jdk

MAINTAINER OpenShift Development <dev@lists.openshift.redhat.com>

EXPOSE 9000
USER 0

ENV HOME=/opt/app-root \
    APP_VERSION=0.6.5

RUN mkdir -p ${HOME}
WORKDIR ${HOME}

ADD https://github.com/lmenezes/cerebro/releases/download/v${APP_VERSION}/cerebro-${APP_VERSION}.zip ${HOME}/

RUN cd ${HOME} && \
    unzip cerebro-${APP_VERSION}.zip && \
    chmod -R og+w ${HOME} && \
    mv cerebro-${APP_VERSION} cerebro && \
    rm cerebro-${APP_VERSION}.zip

COPY conf/* ${HOME}/cerebro/conf/

USER 1000

CMD ["/bin/bash", "/opt/app-root/cerebro/bin/cerebro"]
