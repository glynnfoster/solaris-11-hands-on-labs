#!/bin/bash
# This is to copy scripts from the host machine into the VM
mkdir ~lab/scripts
cd ~lab/scripts
scp panni@10.0.2.2:/home/panni/Projects/os11-hol/scripts/zoneplot zoneplot
scp panni@10.0.2.2:/home/panni/Projects/os11-hol/scripts/diskeater.py diskeater.py
scp panni@10.0.2.2:/home/panni/Projects/os11-hol/scripts/driveGnuPlotStreams.pl driveGnuPlotStreams.pl
