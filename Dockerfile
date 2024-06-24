FROM visibilityspots/gotify-cli:v2.2.4

COPY domain-watcher /usr/local/bin/domain-watcher

ENTRYPOINT ["/usr/local/bin/domain-watcher"]
