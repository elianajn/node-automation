node 'radoni.llnl.gov {

$enhancers = [ 'ntp', 'ntpdate' ]
  package { $enhancers: ensure => 'installed' }

service { 'ntpd' :
	enable => "true",
}
}
