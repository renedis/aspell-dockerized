FROM ubuntu:20.04
LABEL AUTHOR Kinoba
ENV LANG C.UTF-8

WORKDIR /tmp

RUN apt-get -qq update \
    && apt-get install -y ca-certificates aspell aspell-en aspell-fr \
    && useradd -ms /bin/bash aspell

USER aspell

WORKDIR /home/aspell

CMD cat *.txt | aspell --lang=en --encoding=utf-8 list | aspell --lang=fr --encoding=utf-8 list

