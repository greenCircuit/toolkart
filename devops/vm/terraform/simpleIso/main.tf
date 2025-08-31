terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "~> 2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "http://127.0.0.1:8006/api2/json"
  pm_api_token_id = "root@pam!test"
  pm_api_token_secret = "YOUR_TOKEN"
  pm_tls_insecure = true  # Set to false in production
}

resource "proxmox_vm_qemu" "vm" {
  name        = "terraform-vm"
  target_node = "pve"  # Change to your Proxmox node name
#   clone       = "debian-template"  # Change to your existing template (not cloud-init)

  cores       = 1
  sockets     = 1
  cpu         = "host"
  memory      = 2024

  disk {
    size    = "10G"
    type    = "scsi"
    storage = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  # Uncomment if using an ISO instead of a template
  iso = "local:iso/debian-12.9.0-amd64-netinst.iso"

  agent = 1  # Enable QEMU Guest Agent

  lifecycle {
    ignore_changes = [network]
  }
}
