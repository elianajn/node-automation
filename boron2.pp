$folder="/opt/puppetlabs/puppet/manifests/boron/boron2"
package { ['ntp', 'ntpdate', 'nfs-utils', 'libibverbs-utils', 'infiniband-diags', 'ibutils', 'perftest', 'libmlx4', 'libibverbs', 'opensm', 'net-tools', 'openmpi', 'openmpi-devel', 'freeipmi', 'rpm-build', 'bzip2-devel', 'perl-ExtUtils-MakeMaker', 'perl-Switch', 'openssl', 'openssl-devel', 'pam-devel', 'readline-devel', 'mariadb-devel', 'mariadb-server'] :
  ensure => 'installed',
}
#file { '/etc/sysconfig/network-scripts/ifcfg-ib0':
#        ensure => "file",
#        owner  => "root",
#        group  => "root",
#        mode   => "644",
#	seluser => "system_u",
#        source => "$folder/ifcfg-ib0",
#}
file { '/etc/passwd':
        ensure => "file",
        owner  => "root",
        group  => "root",
        mode   => "644",
        seluser => "system_u",
        source => "$folder/passwd",
}
file { '/etc/group':
        ensure => "file",
        owner  => "root",
        group  => "root",
        mode   => "644",
        seluser => "system_u",
        source => "$folder/group",
}
file { '/etc/shadow':
        ensure => "file",
        owner  => "root",
        group  => "root",
        mode   => "000",
        seluser => "system_u",
        source => "$folder/shadow",
}
file { '/etc/gshadow':
        ensure => "file",
        owner  => "root",
        group  => "root",
	mode   => "000",
        seluser => "system_u",
        source => "$folder/gshadow",
}
file { '/etc/hosts':
        ensure => "file",
        owner  => "root",
        group  => "root",
        mode   => "644",
        seluser => "system_u",
        source => "$folder/hosts",
}
file { '/etc/resolv.conf':
        ensure => "file",
        owner  => "root",
        group  => "root",
        mode   => "644",
        seluser => "system_u",
        source => "$folder/resolv.conf",
}
#file { '/etc/sysconfig/network-scripts/ifcfg-em1':
#        ensure => "file",
#        owner  => "root",
#        group  => "root",
#        mode   => "644",
#        seluser => "system_u",
#        source => "$folder/ifcfg-em1",
#}
#file { '/etc/sysconfig/network-scripts/ifcfg-em2':
#        ensure => "file",
#        owner  => "root",
#        group  => "root",
#        mode   => "644",
#        seluser => "system_u",
#        source => "$folder/ifcfg-em2",
#}
file { '/etc/sysctl.conf':
        ensure => "file",
        owner  => "root",
        group  => "root",
        mode   => "644",
        seluser => "system_u",
        source => "$folder/sysctl.conf",
}file { '/etc/fstab':
        ensure => "file",
        owner  => "root",
        group  => "root",
        mode   => "644",
        seluser => "system_u",
        source => "$folder/fstab",
}
file { '/etc/profile.d/mpi.sh':
        ensure => "file",
        owner  => "root",
        group  => "root",
        mode   => "644",
        source => "$folder/mpi.sh",
        seluser => "unconfined_u",
}
exec { 'ifdown':
  command => "ifdown ib0",
  path => '/sbin:/bin:/usr/sbin:/usr/bin',
}
exec { 'ifup':
  command => "ifup ib0",
  path => '/sbin:/bin:/usr/sbin:/usr/bin',
}
exec { 'ntpq_-c_pe':
  command => "ntpq -c pe",
  path => '/sbin:/bin:/usr/sbin:/usr/bin',
}
exec { 'selinux':
  command => "setsebool -P use_nfs_home_dirs 1",
  path => '/sbin:/bin:/usr/sbin:/usr/bin',
}
service{ [ 'ntpd', 'opensm', 'sshd']:
	ensure => 'running',
	enable => 'true',
}
