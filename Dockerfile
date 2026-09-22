FROM visibilityspots/gotify-cli:v2.4.1

# the base image drops to the unprivileged gotify user; apk needs root
USER root

RUN apk add --no-cache whois

COPY domain-watcher /usr/local/bin/domain-watcher

USER gotify

ENTRYPOINT ["/usr/local/bin/domain-watcher"]
