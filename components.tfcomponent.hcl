required_providers {
  time = {
    source  = "hashicorp/time"
    version = "~> 0.14.1"
  }
}

provider "time" "default" {}

variable "sleep_duration" {
  type    = string
  default = "60s"
}

variable "force_rerun_id" {
  type    = string
  default = "default-run"
}

component "timer" {
  source = "./modules/delay"

  inputs = {
    duration = var.sleep_duration
    run_id   = var.force_rerun_id
  }

  providers = {
    time = provider.time.default
  }
}

output "timer_status" {
  type = string
  value = component.timer.status
}
