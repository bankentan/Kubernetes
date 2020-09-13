resource "google_service_account_iam_binding" "sa_impersonation" {
  count = "${length(var.iam_policy)}"
  service_account_id = "projects/${var.gcp_project}/serviceAccounts/${var.iam_policy[count.index][0]}@${var.gcp_project}.iam.gserviceaccount.com"
  role = "roles/${var.iam_policy[count.index][2]}"
  members = var.iam_policy[count.index][1]
}
