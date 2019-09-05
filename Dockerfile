FROM ubuntu:bionic

WORKDIR /var/www

RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget http://install.speedtest.net/ooklaserver/ooklaserver.sh && \
    chmod a+x ooklaserver.sh && \
    ./ooklaserver.sh install -f

# Expose the default port
EXPOSE 8080 5060

CMD ["./OoklaServer", "start"]
