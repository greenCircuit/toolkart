# Variable Definitions
# variable "proxmox_api_url" {
#     type = string
# }

# variable "proxmox_api_token_id" {
#     type = string
# }

# variable "proxmox_api_token_secret" {
#     type = string
#     sensitive = true
# }

# Resource Definiation for the VM Template
source "proxmox" "debian-server-focal" {

    # Proxmox Connection Settings
    proxmox_url = "http://127.0.0.1:8006/api2/json"
    username = "root@pam!test"
    token = "dce7de31-d0a6-4886-93ef-80b79780ef0b"
    # (Optional) Skip TLS Verification
    insecure_skip_tls_verify = true

    # VM General Settings
    node = "pve"
    vm_id = "101"
    vm_name = "ubuntu-server-focal"
    template_description = "Ubuntu Server Focal Image"

    # VM OS Settings
    iso_file = "local:iso/debian-12.9.0-amd64-netinst.iso"

    iso_storage_pool = "local"
    unmount_iso = true

    # VM System Settings
    qemu_agent = true

    # VM Hard Disk Settings
    scsi_controller = "virtio-scsi-pci"

    disks {
        disk_size = "20G"
        format = "raw"
        storage_pool = "local-lvm"
        storage_pool_type = "lvm"
        type = "virtio"
    }

    # VM CPU Settings
    cores = "2"

    # VM Memory Settings
    memory = "2048"

    # VM Network Settings
    network_adapters {
        model = "virtio"
        bridge = "vmbr0"
        firewall = "false"
    }

    # VM Cloud-Init Settings
    cloud_init = true
    cloud_init_storage_pool = "local-lvm"

    # PACKER Boot Commands
    boot_command = [
    "<esc><wait>",
    "auto file=debian-preseed.cfg ",
    "<enter>"
    ]
    boot = "c"
    boot_wait = "5s"

    ssh_username = "dev"

    # (Option 1) Add your Password here
    ssh_password = "dev"

}

# Build Definition to create the VM Template
build {

    name = "ubuntu-server-focal"
    sources = ["source.proxmox.debian-server-focal"]



    # Add additional provisioning scripts here
    
}