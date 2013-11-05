define mon::hostgroup ($groupname,$members=[]) {
  concat::fragment {"mon_hostgroup_${groupname}":
    target  => '/etc/mon/mon.cf',
    content => template('mon/hostgroup.erb'),
    order   => 30,
    notify  => Service['mon']
  }
}
