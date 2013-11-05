define mon::hostgroup ($members=[]) {
  concat::fragment {"mon_hostgroup_${name}":
    target  => '/etc/mon/mon.cf',
    content => template('mon/hostgroup.erb'),
    order   => 30,
    notify  => Service['mon']
  }
}
