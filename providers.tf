provider "github" {
  token        = var.github_token
  owner        = var.git_owner
}

provider "tfe" {
  token = var.tfe_token
}