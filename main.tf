resource "aws_securityhub_account" "security_hub" {}

#pci dss standard control will not be enabled by default so separate source cretion is required
resource "aws_securityhub_standards_subscription" "pci_321" {
  depends_on    = [aws_securityhub_account.security_hub]
  standards_arn = var.pci_standards_arn
}

#create members and send invite to member accounts
resource "aws_securityhub_member" "security_hub_member" {
  depends_on = [aws_securityhub_account.security_hub]
  count      = length(var.account_ids)
  account_id = var.account_ids[count.index]
  email      = var.email_ids[count.index]
  invite     = var.enable_security_hub
}
