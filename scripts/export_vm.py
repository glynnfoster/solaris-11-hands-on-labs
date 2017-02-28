#!/usr/bin/python
# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
# This script is created to save your time when exporting Oracle VirtualBox VMs
# and creating appliances (a.k.a. templates). Especially if you have to do it
# several times a day.
# The script uses VBoxManage command line and sets certain parameters for the
# resulting appliance (see below). Make sure you have downloaded and stored 
# somewhere the OS license as a text file. Current location for Oracle Solaris
# Development and Evaluation license: 
# http://www.oracle.com/technetwork/licenses/solaris-cluster-express-license-167852.html
#
# The script will list the virtual machines you have created and let you choose 
# the one you want to export. By default it will create the .ova file in the
# current directory, but you can change that. Make sure you have enough space.
#
import sys
import subprocess
import re

vmlist = []
# Variables to use when exporting VBox appliance
# Change them according to your situation: specifically the EULA file path and product version
prod_name = "Oracle Solaris"
prod_url = "http://oracle.com/solaris"
vendor_name = "Oracle"
vendor_url = "http://oracle.com"
prod_version = "11.3"
eula_file = "/home/panni/Projects/os11-hol/OTN_Solaris_License.txt"
prod_descr = "Oracle Solaris 11.3 is a complete, integrated platform, combining OpenStack, software-defined networking, and built-in virtualization with a proven enterprise-class operating system."

proc = subprocess.check_output(["/usr/bin/VBoxManage", "list", "vms"])
vmraw = proc.split("\n")
print vmraw
for vm in vmraw:
    print vm
    b = re.match(r"\"(.+)\" {(.+)}", vm)
    if b:
	vmlist.append([b.group(1), b.group(2)])

print "Number of VMs: ", len(vmlist)

print "Choose the VM to export from the list:"

for i, vm in enumerate(vmlist):
    print repr(i+1).rjust(2)+".", vm[0]
    
vmno = raw_input('VM to export (enter the number): ')

 
if int(vmno) > len(vmlist) or int(vmno) < 1:
    print "There is no such VM! Exiting..."
    sys.exit()
else:
# Now build the lo-ong VBoxManage command
    ofile = vmlist[int(vmno)-1][0] + '.ova'
    new_ofile = raw_input("Default appliance file: '" + ofile +"'.\nPress [Enter] to accept or input a new name: ")
    if new_ofile == "":
	new_ofile = ofile
    cmd = ["VBoxManage", "export", vmlist[int(vmno)-1][1], 
           "-o", new_ofile, 
           "--vsys", "0", 
           "--product", prod_name,
           "--producturl", prod_url,
           "--vendor", vendor_name, 
           "--vendorurl", vendor_url,
           "--version", prod_version, 
           "--eulafile", eula_file,
           "--description", prod_descr ] 

    subprocess.call (cmd, shell=False)
