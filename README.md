# DomainWatcher


[![trivy](https://github.com/visibilityspots/dockerfile-domain-watcher/actions/workflows/trivy.yml/badge.svg)](https://github.com/visibilityspots/dockerfile-domain-watcher/actions/workflows/trivy.yml)
[![docker-hub-description](https://github.com/visibilityspots/dockerfile-domain-watcher/actions/workflows/docker-hub-description.yml/badge.svg)](https://github.com/visibilityspots/dockerfile-domain-watcher/actions/workflows/docker-hub-description.yml)
[![build status](https://github.com/visibilityspots/dockerfile-domain-watcher/actions/workflows/main.yaml/badge.svg)](https://github.com/visibilityspots/dockerfile-domain-watcher/actions/workflows/main.yaml)
[![gitHub release](https://img.shields.io/github/v/release/visibilityspots/dockerfile-domain-watcher)](https://github.com/visibilityspots/dockerfile-domain-watcher/releases)
[![docker image size](https://img.shields.io/docker/image-size/visibilityspots/domain-watcher/latest)](https://hub.docker.com/r/visibilityspots/domain-watcher)
[![docker pulls](https://img.shields.io/docker/pulls/visibilityspots/domain-watcher.svg)](https://hub.docker.com/r/visibilityspots/domain-watcher/)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

a docker container which checks if a given domain is still available and sends a message through [gotify](https://gotify.net/) using [gotify-cli](https://github.com/visibilityspots/dockerfile-gotify-cli)

## configuration

fetch your gotify token from the config file created by gotify [initialization](https://github.com/gotify/cli?tab=readme-ov-file#configuration) which you could perform on your local machine or from within a docker container.
```
cat cli.json
{
  "token": "BAR",
  "url": "FOO",
  "defaultPriority": 0
}
```

## run

```
$ docker run --rm -e GOTIFY_URL=FOO -e GOTIFY_TOKEN=BAR visibilityspots/domain-watcher:latest visibilityspots.org
```

## build

```
$ docker build -t visibilityspots/domain-watcher:dev .
```

## test

I wrote some tests in a goss.yaml file which can be executed by [dgoss](https://github.com/aelsabbahy/goss/tree/master/extras/dgoss)

```
$ dgoss run --entrypoint='' visibilityspots/domain-watcher:dev sleep 5                                                                                ✔ 
INFO: Starting docker container
INFO: Container ID: 71c3d5cb
INFO: Sleeping for 0.2
INFO: Container health
INFO: Running Tests
Command: domain-watcher: exit-status: matches expectation: [0]
Command: whois visibilityspots.org: exit-status: matches expectation: [0]


Total Duration: 0.633s
Count: 2, Failed: 0, Skipped: 0
INFO: Deleting container

```

## License
Distributed under the [MIT](https://opensource.org/licenses/MIT) license
