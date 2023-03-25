# DomainWatcher


[![build status](https://github.com/visibilityspots/dockerfile-domain-watcher/actions/workflows/main.yaml/badge.svg)](https://github.com/visibilityspots/dockerfile-domain-watcher/actions/workflows/main.yaml)
[![docker image size](https://img.shields.io/docker/image-size/visibilityspots/domain-watcher/latest)](https://hub.docker.com/r/visibilityspots/domain-watcher)
[![docker pulls](https://img.shields.io/docker/pulls/visibilityspots/domain-watcher.svg)](https://hub.docker.com/r/visibilityspots/domain-watcher/)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

a docker container which checks if a given domain is still available and sends a message through [telegram](https://telegram.org/) using [ntfy](https://ntfy.readthedocs.io/en/latest/)

## configuration

fetch your telegram credentials from the config file created by ntfy [initialization](https://ntfy.readthedocs.io/en/latest/#telegram-telegram) which you could perform on your local machine or from within a docker container.
```
cat ~/.config/ntfy/telegram.ini
[telegram]
token = FOO
chat_id = BAR
```

## run

```
$ docker run --rm -e TELEGRAM_TOKEN=FOO -e TELEGRAM_CHAT_ID=BAR visibilityspots/domain-watcher:latest visibilityspots.org
```

## build

```
$ docker build -t visibilityspots/domain-watcher:dev .
```

## test

I wrote some tests in a goss.yaml file which can be executed by [dgoss](https://github.com/aelsabbahy/goss/tree/master/extras/dgoss)

```
$ dgoss run visibilityspots/domain-watcher:dev visibilityspots.org
INFO: Starting docker container
INFO: Container ID: c26cbf3d
INFO: Sleeping for 0.2
INFO: Container health
INFO: Running Tests
File: /home/watcher/.config/ntfy/telegram.ini: exists: matches expectation: [true]
File: /home/watcher/.config/ntfy/telegram.ini: owner: matches expectation: ["watcher"]
File: /home/watcher/.config/ntfy/telegram.ini: group: matches expectation: ["nogroup"]
User: watcher: exists: matches expectation: [true]
User: watcher: home: matches expectation: ["/home/watcher"]
Command: whois --version: exit-status: matches expectation: [0]
Command: whois --version: stdout: matches expectation: [Version 5.5.10.]
Package: whois: installed: matches expectation: [true]
Command: ntfy --version: exit-status: matches expectation: [0]
Command: ntfy --version: stdout: matches expectation: [2.7.0]
INFO: Deleting container

```

## License
Distributed under the [MIT](https://opensource.org/licenses/MIT) license
