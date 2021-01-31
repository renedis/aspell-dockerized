FROM ubuntu:20.04
LABEL AUTHOR Kinoba
ENV LANG C.UTF-8

WORKDIR /tmp

RUN apt-get -qq update \
    && apt-get install -y ca-certificates aspell aspell-en aspell-fr \
    && useradd -ms /bin/bash aspell

USER aspell

WORKDIR /home/aspell

COPY docker-entrypoint.sh .

ENTRYPOINT ["/home/aspell/docker-entrypoint.sh"]
