FROM ubuntu:14.04
MAINTAINER Alex Castle <agcastle64@gmail.com>
  
RUN useradd factorio \
  && apt-get update \
  && apt-get install wget alsa-lib libX11 \
  && mkdir -p /app/data \
  && chown -R factorio /app \
  && chmod -R 775 /app \

  
ADD entrypoint.sh /app/entrypoint.sh
VOLUME ["/app/data"]
EXPOSE 34197/udp
USER factorio
WORKDIR "/app"

RUN cd wget https://www.factorio.com/get-download/0.12.26/headless/linux64 -0 factorio.tar.gz \
  && tar -xzf factorio.tar.gz \
  && rm factorio.tar.gz

ENTRYPOINT ["/app/entrypoint.sh"]