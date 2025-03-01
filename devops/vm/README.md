# About
- going to automate to install new vm with defined dependencies inside proxmox
- using virtual box to run proxmox since dont have extra hardware

# Goal
- packer and terraform will install nginx package inside new vm
- will add some files to new vm
- make proxmox to update its images?
- gitlab ci?
- automate most of the stuff for sure

# Pipeline 
Create Image(packer) -> Deploy Image(terraform) -> Configure VM(ansible)  \


# Set up
- need to port forward 8006:8006 from VM to local host, guest IP = vm IP, host ip = 127.0.0.1
- attached to NAT
- webrowser 127.0.0.1:8006 
- need to click all advances setting in virtual box cpu setting so can create vms
    -   Will get this error otherwise `TASK ERROR: KVM virtualisation configured, but not available. Either disable in VM configuration or enable in BIOS.`


    https://ronamosa.io/docs/engineer/LAB/proxmox-packer-vm/