define mon::watch ($hostgroup,$mail,$service='ping',$interval='5m',$monitor='fping.monitor') {
  concat::fragment {"mon_watch_${hostgroup}_${service}":
    target  => '/etc/mon/mon.cf',
    content => templates('mon/watch.erb'),
    order   => 30,
    notify  => Service['mon']
  }
}
