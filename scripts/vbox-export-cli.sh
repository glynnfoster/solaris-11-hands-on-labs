#!/bin/sh
VBoxManage export "Oracle Solaris 11.2" -o "Oracle Solaris 11.2 Lab.ova" --vsys 0 --product "Oracle Solaris" --producturl "http://oracle.com/solaris" --vendor "Oracle Corp." --vendorurl "http://oracle.com" --version "11.2" --eulafile "/home/panni/Projects/Oracle Solaris 11 Hands-on Labs/OTN_Solaris_License.txt" 
