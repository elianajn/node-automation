#!/bin/bash
FOLDER=/opt/puppetlabs/puppet/manifests/boron2/
mkdir $FOLDER
cp /etc/passwd $FOLDER
cp /etc/group $FOLDER
cp /etc/shadow $FOLDER
cp /etc/gshadow $FOLDER
cp /etc/sysconfig/network-scripts/ifcfg-ib0 $FOLDER
cp /etc/profile.d/mpi.sh $FOLDER
#cp /etc/slurm/slurm.conf $FOLDER
cp /etc/hosts $FOLDER
cp /etc/hostname $FOLDER
cp /etc/resolv.conf $FOLDER
cp /etc/sysconfig/network-scripts/ifcfg-em1 $FOLDER
cp /etc/sysconfig/network-scripts/ifcfg-em2 $FOLDER
cp /etc/sysctl.conf $FOLDER
cp /etc/fstab $FOLDER
cp /root/.ssh/authorized_keys $FOLDER
