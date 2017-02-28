#!/usr/bin/python
# This is to add a SCSI controller and several disks to the VM
import sys
import os
import subprocess


ndisks = 12
ctl_name = "SATA"
vm_name = "Oracle Solaris 11.2 Lab"
disk_fn_base = "satadisk"
disk_fn = disk_fn_base
disk_size = 200
port_no = 0
device_no = 0

# First, prepare the commands
attach_ctl =  ["VBoxManage", "storagectl", vm_name,
               "--name", ctl_name, "--add", "scsi" ]

create_disk = ["VBoxManage", "createhd", 
               "--filename", disk_fn,
               "--size", str(disk_size) ]
attach_disk = ["VBoxManage", "storageattach", vm_name,
               "--storagectl", ctl_name,
               "--port", str(port_no),
               "--device", str(device_no),
               "--type", "hdd",
               "--medium", disk_fn ]

# Now attach the SCSI controller
subprocess.call (attach_ctl, shell=False)

# Create 12 disks and attach them to the VM
for i in range (ndisks):
    disk_fn = os.getcwd() + "/" + disk_fn_base + str(i) # sequential name
    print disk_fn
    create_disk[3] = disk_fn #assign this name to the cmd list element
    subprocess.call (create_disk, shell=False)
    port_no = str(i+4)
    attach_disk[6] = port_no
    attach_disk[12] = disk_fn + ".vdi"
    subprocess.call (attach_disk, shell=False)
