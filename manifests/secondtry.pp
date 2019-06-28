node 'radoni.llnl.gov' {

file { '/etc/hosts':
	ensure => "file",
	owner  => "root",
	group  => "root",
	mode   => "700",
	source => "/etc/puppet/files/hosts", 
}

file { '/etc/resolv.conf':
        ensure => "file",
        owner  => "root",
        group  => "root",
        mode   => "700",
        source => "/etc/puppet/files/resolv.conf",
}
}
