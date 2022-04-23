module "component" {
  for_each = var.ALL_COMPONENTS
  source = "./ec2"
  COMPONENT = each.key
  APP_VERSION = each.value.app_version
}
