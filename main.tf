resource "tfe_oauth_client" "github" {
  organization     = var.tfe_org_name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_token
  service_provider = "github"
}

resource "tfe_workspace" "prd_eu-west-1" {
  name         = "mm-sky-demo-auto-1"
  organization = var.tfe_org_name
  auto_apply        = false
  operations        = true
  queue_all_runs    = true
  file_triggers_enabled = true
  vcs_repo {
    identifier         = var.identifier
    branch             = "master"
    ingress_submodules = false
    oauth_token_id     = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_variable" "AWS_ACCESS_KEY_ID" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.AWS_ACCESS_KEY_ID
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.prd_eu-west-1.id
}

resource "tfe_variable" "AWS_SECRET_ACCESS_KEY" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.AWS_SECRET_ACCESS_KEY
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.prd_eu-west-1.id
}
