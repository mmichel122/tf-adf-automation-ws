provider "github" {
  token        = var.github_token
  organization = "modusmtich"
}

provider "tfe" {
  token = var.tfe_token
}