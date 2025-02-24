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
source "proxmox" "ubuntu-server-focal" {

    # Proxmox Connection Settings
    proxmox_url = "http://127.0.0.1:8006/api2/json"
    username = "root@pam!test"
    token = "dce7de31-d0a6-4886-93ef-80b79780ef0b"
    # (Optional) Skip TLS Verification
    insecure_skip_tls_verify = true

    # VM General Settings
    node = "pve"
    vm_id = "100"
    vm_name = "ubuntu-server-focal"
    template_description = "Ubuntu Server Focal Image"

    # VM OS Settings
    # (Option 1) Local ISO File
    iso_file = "local:iso/debian-12.9.0-amd64-netinst.iso"
    # - or -
    # (Option 2) Download ISO
    # iso_url = "https://releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso"
    # iso_checksum = "f8e3086f3cea0fb3fefb29937ab5ed9d19e767079633960ccb50e76153effc98"
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
    cores = "1"

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
    # boot_command = [
    #     "<esc><wait><esc><wait>",
    #     "<f6><wait><esc><wait>",
    #     "<bs><bs><bs><bs><bs>",
    #     "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ",
    #     "--- <enter>"
    # ]
    # boot = "c"
    # boot_wait = "5s"

    # PACKER Autoinstall Settings
    # http_directory = "http"
    # (Optional) Bind IP Address and Port
    # http_bind_address = "0.0.0.0"
    # http_port_min = 8802
    # http_port_max = 8802

    ssh_username = "admin"

    # (Option 1) Add your Password here
    ssh_password = "admin"
    # - or -
    # (Option 2) Add your Private SSH KEY file here
    # ssh_private_key_file = "~/.ssh/id_rsa"

    # Raise the timeout, when installation takes longer
    ssh_timeout = "20m"
}

# Build Definition to create the VM Template
build {

    name = "ubuntu-server-focal"
    sources = ["source.proxmox.ubuntu-server-focal"]



    # Add additional provisioning scripts here
    
}