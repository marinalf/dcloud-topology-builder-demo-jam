data "dcloud_inventory_networks" "inventory_networks" {
  topology_uid = dcloud_topology.demo_topology.id
}

data "dcloud_networks" "networks_in_topology" {
  topology_uid = dcloud_topology.demo_topology.id
}

data "dcloud_inventory_vms" "inventory_vms" {
  topology_uid = dcloud_topology.demo_topology.id
}