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

```docker run --rm -e TELEGRAM_TOKEN=FOO -e TELEGRAM_CHAT_ID=BAR visibilityspots/domain-watcher:latest visibilityspots.org```

## test

I wrote some tests in a goss.yaml file which can be executed by [dgoss](https://github.com/aelsabbahy/goss/tree/master/extras/dgoss)

```
INFO: Starting docker container
INFO: Container ID: 409d41a7
INFO: Sleeping for 0.2
INFO: Running Tests
File: /home/watcher/.config/ntfy/telegram.ini: exists: matches expectation: [true]
File: /home/watcher/.config/ntfy/telegram.ini: owner: matches expectation: ["watcher"]
File: /home/watcher/.config/ntfy/telegram.ini: group: matches expectation: ["watcher"]
User: watcher: exists: matches expectation: [true]
User: watcher: home: matches expectation: ["/home/watcher"]
Command: whois --version: exit-status: matches expectation: [0]
Package: whois: installed: matches expectation: [true]


Total Duration: 0.012s
Count: 7, Failed: 0, Skipped: 0
INFO: Deleting container
```

## License
Distributed under the [MIT](https://opensource.org/licenses/MIT) license
