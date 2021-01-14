terraform {
  required_version  = ">=0.12"
}

resource "tfe_oauth_client" "github" {
  organization      = var.tfe_org_name
  api_url           = "https://api.github.com"
  http_url          = "https://github.com"
  oauth_token       = var.github_token
  service_provider  = "github"
  depends_on        = [tfe_variable.region, tfe_variable.workspace_name, tfe_variable.workspace_team]
}

resource "tfe_workspace" "workspace" {
  name                  = var.tfe_workspace_name
  organization          = var.tfe_org_name
  auto_apply            = true
  operations            = true
  queue_all_runs        = true
  file_triggers_enabled = true
  vcs_repo {
    identifier          = var.identifier
    branch              = "main"
    ingress_submodules  = false
    oauth_token_id      = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_variable" "AWS_ACCESS_KEY_ID" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.AWS_ACCESS_KEY_ID
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "AWS_SECRET_ACCESS_KEY" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.AWS_SECRET_ACCESS_KEY
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "workspace_name" {
  key          = "workspace_name"
  value        = var.tfe_workspace_name
  category     = "terraform"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "workspace_team" {
  key          = "workspace_team"
  value        = var.tfe_workspace_team
  category     = "terraform"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "region" {
  key          = "region"
  value        = var.region
  category     = "terraform"
  workspace_id = tfe_workspace.workspace.id
}
