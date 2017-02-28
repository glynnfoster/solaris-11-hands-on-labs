#!/bin/sh
VBoxManage export "Oracle Solaris 11.1" -o "Oracle Solaris 11.1 Lab.ova" --vsys 0 --product "Oracle Solaris" --producturl "http://oracle.com/solaris" --vendor "Oracle Corp." --vendorurl "http://oracle.com" --version "11.1" --eulafile "/home/panni/Projects/SolarisLab/Oracle Solaris OTN License.txt" 
