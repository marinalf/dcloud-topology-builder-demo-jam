output "networks" {
  value = data.dcloud_networks.networks_in_topology
}

output "vms" {
  value = data.dcloud_inventory_vms.inventory_vms
}

