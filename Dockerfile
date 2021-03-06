FROM ubuntu:14.04
MAINTAINER Alex Castle <agcastle64@gmail.com>

ARG FACTORIO_DOWNLOAD_URL="https://www.factorio.com/get-download/0.12.26/headless/linux64"

RUN useradd factorio \
  && apt-get update \
  && apt-get install -y wget \
  && wget ${FACTORIO_DOWNLOAD_URL} -O /tmp/factorio.tar.gz --no-check-certificate \
  && tar -xzf /tmp/factorio.tar.gz -C /tmp \
  && rm /tmp/factorio.tar.gz \
  && mv /tmp/factorio/ /app/ \
  && mkdir -p /app/saves
ADD entrypoint.sh /app/entrypoint.sh
RUN chown -R factorio:factorio /app \
  && chmod -R 775 /app

VOLUME ["/app/saves"]
EXPOSE 34197/udp
USER factorio
WORKDIR "/app"
ENTRYPOINT ["/app/entrypoint.sh"]