output "debug_dashboard" {
  value = file("${path.module}/cloudwatch-dashboard.json")
}
