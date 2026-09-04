terraform {
  required_providers {
    time = {
        source = "hashicorp/time"
        version = "~> 0.14.1"
    }
  }
}

variable "delay_time" {
  type = string
  default = "30s"
}

variable "trigger" {
  type        = string
  description = "The upstream resource ID or attribute to wait for"
}

resource "time_sleep" "wait" {
  create_duration = var.delay_time
  
  triggers = {
    upstream = var.trigger
  }
}

output "ready" {
  value = time_sleep.wait.id
}