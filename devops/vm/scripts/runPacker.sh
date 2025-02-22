#!/bin/bash
# run packer built
packer plugins install github.com/hashicorp/proxmox
cd ./packer
ls
packer build -var-file vars.pkrvars.hcl .