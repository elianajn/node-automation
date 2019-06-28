node "radoni.llnl.gov"{

cron{ 'repo':
	command => "git remote add origin git@github.com:elianajn/puppet-test.git",
	user => "root",
	hour => 2,
	minute => 0,
}

cron { 'pullfromgit':
  command => "cd /etc && git pull",
  user    => "root",
  hour    => 2,
  minute  => 0,
}

cron {'puppetapply':
	command => "puppet apply /etc/puppet/manifests/tryingitout.pp", 
	user => "root",
	hour => 2,
	minute => 0,
}

user { 'eliana':
	ensure   => present,
	uid      => '1002',
	gid      => '1002',
	shell    => '/bin/bash',
}

}
