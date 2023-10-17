## ORG ID o-qwoiuffvxt

data "aws_route53_zone" "primary" {
    name = var.domain_name
}

data "aws_sts_caller_identity" "current" {}

resource "aws_route53_record" "delegation" {
    zone_id = data.aws_route53_zone.primary.zone_id
    name    = var.subdomain_name
    type    = "NS"
    ttl     = "60"
    records = var.name_servers
}

resource "aws_dynamodb_table_item" "example" {
  table_name = "zones-stg"
  hash_key   = "name"
  item = <<ITEM
{
  "name": {"S": ${var.subdomain_name}},
  "owner": {"N": ${data.aws_sts_caller_identity.current.account_id}},
}
ITEM
}


