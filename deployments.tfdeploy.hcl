deployment "development" {
  inputs = {
    sleep_duration = "360s"
    force_rerun_id = "run-main-2" # Increment this string (e.g., "run-2") whenever you want to force a manual rerun
  }
}
