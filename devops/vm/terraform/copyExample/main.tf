terraform {
  required_version = ">= 1.1.0"
  required_providers {
    proxmox = {
      source  = "thegameprofi/proxmox"
      version = ">= 2.9.5"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "http://127.0.0.1:8006/api2/json"
  pm_api_token_id = "root@pam!test2"
  pm_api_token_secret = "3e4d98b0-f725-45ad-858e-236106e501b4"
  pm_tls_insecure = true  # Set to false in production
}



resource "proxmox_vm_qemu" "cloudinit-test" {
    target_node = "pve"  # Change to your Proxmox node name
    cores       = 1
    sockets     = 1
    memory      = 2024
    name = "terraform-test-vm-update"
    clone       = "VM 100"  # Change to your existing template (not cloud-init)
    # Node name has to be the same name as within the cluster
    # this might not include the FQDN


  network {
    bridge   = "vmbr0"
    model    = "virtio"
  }
  ipconfig0 = "ip=dhcp" 

  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "20G"
    slot    = 0
  }

}
