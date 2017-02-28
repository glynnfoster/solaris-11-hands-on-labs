#!/bin/bash
i=0

for n in `VBoxManage list vms | awk -F "\"" '{print "\"" $2 "\""}'`; do
  echo $n
  VMS[i]=$n
  i=$((i+1))
done
nvms=$((i-1))
echo $nvms

i=0

for vm in ${VMS[@]}; do
  echo -n $i
  echo ${VMS[vm]}
  i=$((i+1))
done
