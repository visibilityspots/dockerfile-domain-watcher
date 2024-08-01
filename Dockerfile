FROM visibilityspots/gotify-cli:v2.3.2

COPY domain-watcher /usr/local/bin/domain-watcher

ENTRYPOINT ["/usr/local/bin/domain-watcher"]
