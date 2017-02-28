#!/bin/sh
svccfg -s application/pkg/server setprop pkg/inst_root=/repo   
svcprop -p pkg/inst_root application/pkg/server 
svcadm refresh application/pkg/server 
svcadm disable application/pkg/server 
svcadm enable application/pkg/server 
pkg set-publisher -G '*' -M '*' -g http://10.0.2.15/ solaris
