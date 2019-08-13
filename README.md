# Instructions for booting node
1. ```cp boron.tar /tftpboot/```
2. Edit the ```/tftpboot/pxelinux.cfg/default``` file so that ```MENU default``` is under network boot
3. Uncomment ```filename "/pxelinux.0";``` under whichever node you're rebooting in ```/etc/dhcp/dhcpd.conf``` 
4. ```systemctl restart dhcpd```
5. Reboot the node
6. After the node has started the network boot undo steps 2 and 3 and redo 4
	1. Move ```MENU default``` to under local boot in ```/tftpboot/pxelinux.cfg/default```
	2. Recomment ```filename "/pxelinux.0";``` in ```/etc/dhcp/dhcpd.conf``` 
	3. ```systemctl restart dhcpd````
7. ssh into the node with the default password ```Changeme123```
8. ```cd /opt/puppetlabs/puppet/manifests/boron/```
9. ```puppet apply boron.pp```
10. ```sh infiniband.sh``` 
