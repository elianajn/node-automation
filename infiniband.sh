#!/bin/bash
ib0=/etc/sysconfig/network-scripts/ifcfg-ib0
sed -i '/CONNECTED_MODE=no/d' $ib0
echo 'CONNECTED_MODE=yes' >> $ib0
echo 'BOOTPROTO=static' >> $ib0
echo 'ONBOOT=yes' >> $ib0
echo 'NETMASK=255.255.224.0' >> $ib0
echo "Enter the infiniband IP: "
read ip
echo 'IPADDR='$ip >> $ib0
ifdown ib0
ifup ib0
mount /home
