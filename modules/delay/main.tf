terraform {
  required_providers {
    time = {
      source  = "hashicorp/time"
      version = "~> 0.14.1"
    }
  }
}

variable "duration" {
  type        = string
  default     = "60s"
  description = "The length of time to sleep."
}

variable "run_id" {
  type        = string
  default     = "1"
  description = "Change this value to force the sleep to rerun on subsequent deployments."
}

resource "time_sleep" "standalone_delay" {
  create_duration = var.duration

  triggers = {
    run_id = var.run_id
  }
}

output "status" {
  value       = "Sleep of ${var.duration} completed successfully."
}
