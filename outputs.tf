 output "networks" {
  value = data.dcloud_inventory_networks.inventory_networks
}

output "vms" {
  value = data.dcloud_inventory_vms.inventory_vms
}