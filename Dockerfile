

FROM golang:1.15-alpine
# This is the Dockerfile used for the action at the root of this repository (action.yml)
USER root
RUN apk update && apk add git curl bash ruby nodejs

# RUN curl -LsSo fossa.zip https://github.com/fossas/spectrometer/releases/download/v2.19.9/fossa_2.19.9_linux_amd64.zip
# RUN unzip -d /usr/local/bin fossa.zip && rm fossa.zip

# copy scripts
COPY ./action-entrypoint.sh /

ENTRYPOINT ["/action-entrypoint.sh"]
CMD []