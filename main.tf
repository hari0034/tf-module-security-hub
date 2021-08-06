resource "aws_securityhub_account" "security_hub" {}

resource "aws_securityhub_member" "security_hub_member" {
  depends_on = [aws_securityhub_account.security_hub]
  count      = length(var.account_id)
  account_id = var.account_id[count.index]
  email      = var.email_id[count.index]
  invite     = true
}
