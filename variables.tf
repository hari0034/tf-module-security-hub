variable "account_ids" { type = list(string) }
variable "email_ids" { type = list(string) }
variable "enable_security_hub" { type = bool }

variable "pci_standards_arn" {
  type = string
}
