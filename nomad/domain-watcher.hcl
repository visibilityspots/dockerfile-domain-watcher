job "domain-watcher" {
  region      = "global"
  datacenters = ["garage"]
  namespace   = "services"
  type        = "batch"

  periodic {
    crons     = ["35 12 * * *"]
    time_zone = "Europe/Brussels"
  }

  group "domain-watcher" {
    vault {
      # token renewal must not bounce the task; secrets arrive via template
      change_mode = "noop"
    }

    restart {
      attempts = 1
      delay    = "15s"
      interval = "60s"
      mode     = "fail"
    }

    task "domain-watcher" {
      template {
        # the token comes from Vault, GOTIFY_URL from the Consul KV prefix
        data = <<EOH
TZ = "Europe/Brussels"
GOTIFY_TOKEN = "{{with secret "kv/data/services/domain-watcher"}}{{.Data.data.gotify_token}}{{end}}"
{{range ls "services/domain-watcher"}}
{{.Key}}={{.Value}}
{{end}}
EOH

        destination = "local/env"
        env         = true
      }

      driver = "podman"

      config {
        image = "visibilityspots/domain-watcher:v2026.9.0"

        # every domain to watch is one argument
        args = [
          "example.be",
        ]

        logging {
          driver = "journald"
          options = [{
            tag = "DOMAIN-WATCHER"
          }]
        }
      }

      resources {
        memory = 50
        cpu    = 100
      }
    }
  }
}
