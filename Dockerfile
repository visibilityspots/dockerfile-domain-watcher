FROM python:3.10.12-slim

RUN apt-get update; \
    apt-get install -y whois=5.5.10 gcc; \
    pip install --no-cache ntfy[telegram]==2.7.0; \
    pip install --no-cache --force-reinstall -v "python-telegram-bot==13.5"; \
    adduser --system watcher; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

COPY domain-watcher /usr/local/bin/domain-watcher

USER watcher

ENTRYPOINT ["/usr/local/bin/domain-watcher"]
