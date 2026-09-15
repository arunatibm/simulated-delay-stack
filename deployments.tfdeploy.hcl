deployment "development" {
  inputs = {
    sleep_duration = "60s"
    force_rerun_id = "run-spec-plan" # Increment this string (e.g., "run-2") whenever you want to force a manual rerun
  }
}
