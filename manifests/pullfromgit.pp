node 'radoni.llnl.gov' {

cron { 'gitpull':
  command => "cd /etc/puppet && git pull origin master",
  user    => "root",
  hour    => 2,
  minute  => 0,
}
}
