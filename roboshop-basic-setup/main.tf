module "component" {
  for_each = ALL_COMPONENTS
  source = "./ec2"
  COMPONENT = each.key
  APP_VERSION = each.value
}
