resource "tfe_oauth_client" "github" {
  organization     = "organization_name"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_token
  service_provider = "github"
}

resource "tfe_workspace" "prd_eu-west-1" {
  name         = "mm-sky-demo-auto-1"
  organization = "modus-demo"
  auto_apply        = false
  operations        = true
  queue_all_runs    = true
  file_triggers_enabled = true
  working_directory     = "providers/aws/eu-west-1/prd"
  vcs_repo {
    identifier         = var.identifier
    branch             = "main"
    ingress_submodules = false
    oauth_token_id     = tfe_oauth_client.github.oauth_token_id
  }
}