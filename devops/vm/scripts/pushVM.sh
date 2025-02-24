#!/bin/bash
# Pushing iso from local host to prox server
# Not working for now?

isoPath="~/Downloads/debian-12.9.0-amd64-netinst.iso"


proxIP="10.0.2.15"
proxUser="root"
isoDestPath="/var/lib/vz/template/iso" # where proxmox stores iso

# scp  "${isoPath}" "${proxUser}"@"${proxIP}":"${isoDestPath}"
scp  ~/Downloads/debian-12.9.0-amd64-netinst.iso root@10.0.2.15:/var/lib/vz/template/iso