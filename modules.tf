module "mm-tf-demo-sky-1" {
  source                = "./modules/workspace"
  tfe_token             = var.tfe_token
  tfe_workspace_name    = "mm-demo-sky-1"
  tfe_org_name          = var.tfe_org_name
  github_token          = var.github_token
  identifier            = var.identifier
  AWS_ACCESS_KEY_ID     = var.AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
}

module "mm-tf-demo-sky-2" {
  source                = "./modules/workspace"
  tfe_token             = var.tfe_token
  tfe_workspace_name    = "mm-demo-sky-2"
  tfe_org_name          = var.tfe_org_name
  github_token          = var.github_token
  identifier            = var.identifier
  AWS_ACCESS_KEY_ID     = var.AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
}