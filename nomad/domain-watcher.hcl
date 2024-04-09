job "domain-watcher" {
  region = "global"
  datacenters = [""]
  type = "batch"

  "periodic {
    cron      = "@daily"
    time_zone = "Europe/Brussels"
  }

  group "domain-watcher" {
    count = 1

    restart {
      attempts = 1
      delay    = "15s"
      interval = "60s"
      mode     = "fail"
    }

    task "domain-watcher" {
      env {
        GOTIFY_TOKEN = "FOO"
        GOTIFY_URL = "BAR"
      }

      driver = "docker"

      config {
        image = "visibilityspots/domain-watcher:latest"
        force_pull = true
        args = [
            "DOMAINS",
            "TO",
            "WATCH"
        ]
        logging {
          type = "journald"
          config {
            tag = "DOMAIN-WATCHER"
          }
        }
      }

      service {
        name = "domain-watcher"
        tags = [
          "domain-watcher"
        ]
      }

      resources {
        memory = 50
        cpu = 100
        network {
          mbits = 1
        }
      }
    }
  }
}
