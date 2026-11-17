FROM visibilityspots/gotify-cli:v2.4.5

# the base image drops to the unprivileged gotify user; apk needs root
USER root

# apk upgrade: pick up Alpine security fixes the base image does not have yet
RUN apk upgrade --no-cache && apk add --no-cache whois

COPY domain-watcher /usr/local/bin/domain-watcher

USER gotify

ENTRYPOINT ["/usr/local/bin/domain-watcher"]
