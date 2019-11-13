# DomainWatcher

[![Build Status](https://travis-ci.org/visibilityspots/dockerfile-domain-watcher.svg?branch=master)](https://travis-ci.org/visibilityspots/dockerfile-domain-watcher)
[![](https://images.microbadger.com/badges/image/visibilityspots/domain-watcher.svg)](https://microbadger.com/images/visibilityspots/domain-watcher)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Docker Pulls](https://img.shields.io/docker/pulls/visibilityspots/domain-watcher.svg)](https://hub.docker.com/r/visibilityspots/domain-watcher/)

a docker container which checks if a given domain is still available and sends a message through [telegram](https://telegram.org/) using [ntfy](https://ntfy.readthedocs.io/en/latest/)

## configuration

```
cat telegram.ini
[telegram]
token = ############
chat_id = ####
```

## run

```docker run --rm -v ${PWD}/telegram.ini:/root/.config/ntfy/telegram.ini visibilityspots/domain-watcher:latest visibilityspots.org```

## test

I wrote some tests in a goss.yaml file which can be executed by [dgoss](https://github.com/aelsabbahy/goss/tree/master/extras/dgoss)

```
$ dgoss run --name domain-watcher --rm -ti visibilityspots/domain-watcher:latest /bin/bash
INFO: Starting docker container
INFO: Container ID: 41c35114
INFO: Sleeping for 0.2
INFO: Running Tests
Command: whois --version: exit-status: matches expectation: [0]
Package: whois: installed: matches expectation: [true]


Total Duration: 0.009s
Count: 2, Failed: 0, Skipped: 0
INFO: Deleting container
```

## License
Distributed under the MIT license
