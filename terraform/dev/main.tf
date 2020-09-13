module "iam_policy_binding" {
  source = "../modules/gke-impersonation"
  iam_policy = var.iam_policy
  gcp_project = var.gcp_project
}
