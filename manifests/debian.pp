class mon::debian inherits mon::base {
  package {'mon': ensure => installed }
  package {'python-pushover': ensure => installed}
  Service['mon'] {
    pattern => '/usr/sbin/mon',
    restart => 'service mon restart',
  }
  file {'/usr/lib/mon/alert.d/pushover.alert':
     ensure  => present,
     source  => 'puppet:///modules/mon/pushover.alert'
  }
}
