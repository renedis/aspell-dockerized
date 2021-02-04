FROM ubuntu:20.04
LABEL AUTHOR Kinoba
ENV LANG C.UTF-8

WORKDIR /tmp

RUN apt-get -qq update \
    && apt-get install -y --no-install-recommends \
        aspell \
        aspell-en \
        aspell-fr \
        ca-certificates \
        unzip \
        wget \
    && useradd -ms /bin/bash aspell

RUN pwd && mkdir /wordlists \
    && wget -O aspell-developer-wordlists-master.zip https://github.com/Kinoba/aspell-developer-wordlists/archive/master.zip \
    && unzip /tmp/aspell-developer-wordlists-master.zip \
    && cat /tmp/aspell-developer-wordlists-master/*.txt >> /wordlists/all.txt \
    && rm -rf /tmp/aspell-developer-wordlists-master*

USER aspell

WORKDIR /home/aspell

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
