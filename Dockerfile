FROM visibilityspots/gotify-cli:v2.2.3

COPY domain-watcher /usr/local/bin/domain-watcher

ENTRYPOINT ["/usr/local/bin/domain-watcher"]
