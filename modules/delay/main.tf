terraform {
  required_providers {
    time = {
      source  = "hashicorp/time"
      version = "~> 0.11.0"
    }
  }
}

variable "run_trigger" {
  type        = string
  description = "A dynamic string (like a deployment ID) to force the sleep to trigger on every stack run."
}

variable "duration" {
  type        = string
  default     = "60s"
  description = "The length of time to sleep."
}

resource "time_sleep" "standalone_delay" {
  create_duration = var.duration

  # Triggers force a recreate/re-run if this value changes between deployments
  triggers = {
    run_id = var.run_trigger
  }
}

output "status" {
  value       = "Sleep of ${var.duration} completed successfully."
  description = "Confirmation output after the timer expires."
}