FROM python:3.8.0-slim

LABEL maintainer="Jan Collijs"

RUN pip install --no-cache ntfy[telegram] && \
    apt-get update && \
    apt-get install -y whois && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY domain-watcher /usr/local/bin/domain-watcher

ENTRYPOINT ["/usr/local/bin/domain-watcher"]
