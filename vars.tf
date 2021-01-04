variable "tfe_token" {
  default = ""
}

variable "tfe_org_id" {
  default     = ""
  description = "ID of organization in TFE to use, if empty, an organization will be created."
}

variable "tfe_org_name" {
  default = ""
}

variable "github_token" {
  default = ""
}

variable "identifier" {
  default = ""
}