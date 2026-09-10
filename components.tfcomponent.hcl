# Define the input variable that the deployment file will supply
variable "deployment_uuid" {
  type        = string
  description = "The automated unique execution ID supplied by the Stacks runner."
}

variable "sleep_duration" {
  type        = string
  default     = "60s"
  description = "Customizable time window for the stack to sleep."
}

# Instantiate the standalone delay component
component "timer" {
  source = "./modules/delay"

  inputs = {
    run_trigger = var.deployment_uuid
    duration    = var.sleep_duration
  }
}

# Expose the component output at the Stack level
output "timer_status" {
  type        = string
  value       = component.timer.status
  description = "The final status of the standalone sleep run."
}