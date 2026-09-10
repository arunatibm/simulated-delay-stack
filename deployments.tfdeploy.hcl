# Define the target deployment environment (e.g., development)
deployment "development" {
  inputs = {
    # context.deployment.id is built natively into Terraform Stacks 
    # and updates automatically with every new orchestrator run.
    deployment_uuid = context.deployment.id
    sleep_duration  = "60s"
  }
}