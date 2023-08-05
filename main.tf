resource "dcloud_topology" "demo_topology" {
  name        = "Demo Jam Topology"
  description = "Sample Topology created via Terraform"
  notes = "Created using Terraform"
  datacenter  = "RTP"
}

resource "dcloud_network" "demo_network" {
  name                 = "Nexus Dashboard & CML"
  description          = "Demo Network"
  inventory_network_id = "L3-VLAN-1"
  topology_uid         = dcloud_topology.demo_topology.id
}

resource "dcloud_vm" "jump_host" {
  inventory_vm_id   = "13085271"
  topology_uid      = dcloud_topology.demo_topology.id
  name              = "Jump Host"
  description       = "windows-10-80gbhdd-preconfig-v1"
  cpu_qty           = 4
  memory_mb         = 8192
  nested_hypervisor = false
  os_family         = "WINDOWS"

  advanced_settings {
    all_disks_non_persistent = false
    bios_uuid                = "42 17 67 67 f9 1f 71 b0-74 ec 4f 0c 79 36 fa 0d"
    name_in_hypervisor       = "computer"
    not_started              = false
  }

  network_interfaces {
    network_uid = dcloud_network.demo_network.id
    name        = "Network adapter 0"
    mac_address = "00:50:56:00:02:AA"
    type        = "VIRTUAL_VMXNET_3"
    ip_address  = "198.18.1.100"
    rdp_enabled = true
  }

  remote_access {
    vm_console_enabled = false
  }
}

## 

resource "dcloud_vm" "nexus_dashboard" {
  inventory_vm_id   = "12324540"
  topology_uid      = dcloud_topology.demo_topology.id
  name              = "NDFC"
  description       = "Nexus_dashboard_2.3_node_1"
  cpu_qty           = 32
  memory_mb         = 131072
  nested_hypervisor = false
  os_family         = "Linux"

  advanced_settings {
    all_disks_non_persistent = false
    bios_uuid                = "42 17 67 67 f9 1f 71 b0-74 ec 4f 0c 79 36 fa 0e"
    name_in_hypervisor       = "Nexus_dashboard_2.3_node_1"
    not_started              = false
  }

  network_interfaces {
    network_uid = dcloud_network.demo_network.id
    name        = "Network adapter 0"
    mac_address = "00:50:56:97:d7:90"
    type        = "VIRTUAL_VMXNET_3"
    ip_address  = "198.18.1.10"
    rdp_enabled = false
  }

  network_interfaces {
    network_uid = "VLAN-PRIMARY"
    name        = "Network adapter 1"
    mac_address = "00:50:56:97:d7:90"
    type        = "VIRTUAL_VMXNET_3"
    ip_address  = "198.18.133.100"
    rdp_enabled = false
  }

  remote_access {
    vm_console_enabled = false
  }
}

resource "dcloud_vm" "cml" {
  inventory_vm_id   = "13071420"
  topology_uid      = dcloud_topology.demo_topology.id
  name              = "CML"
  description       = "sp_cml2_2.6.0-5_amd64-6"
  cpu_qty           = 4
  memory_mb         = 8192
  nested_hypervisor = false
  os_family         = "Linux"

  advanced_settings {
    all_disks_non_persistent = false
    bios_uuid                = "42 17 67 67 f9 1f 71 b0-74 ec 4f 0c 79 36 fa 0f"
    name_in_hypervisor       = "sp_cml2_2.6.0-5_amd64-6"
    not_started              = false
  }

  network_interfaces {
    network_uid = dcloud_network.demo_network.id
    name        = "Network adapter 0"
    mac_address = "00:50:56:97:d7:90"
    type        = "VIRTUAL_VMXNET_3"
    ip_address  = "198.18.1.11"
    rdp_enabled = false
  }

  network_interfaces {
    network_uid = "VLAN-PRIMARY"
    name        = "Network adapter 1"
    mac_address = "00:50:56:97:d7:90"
    type        = "VIRTUAL_VMXNET_3"
    ip_address  = "198.18.133.101"
    rdp_enabled = false
  }

  remote_access {
    vm_console_enabled = false
  }
}
