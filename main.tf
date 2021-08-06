resource "aws_securityhub_account" "security_hub" {}

resource "aws_securityhub_member" "security_hub_member" {
  depends_on = [aws_securityhub_account.security_hub]
  count      = length(var.account_ids)
  account_id = var.account_ids[count.index]
  email      = var.email_ids[count.index]
  invite     = var.enable_security_hub
}
