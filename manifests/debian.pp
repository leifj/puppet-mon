class mon::debian inherits mon::base {
  package {'mon': ensure => installed }
  package {'python-pip': ensure => installed }
  include python
  python::pip {'python-pushover': ensure => present}
  Service['mon'] {
    pattern => '/usr/sbin/mon',
    restart => 'service mon restart',
  }
  file {'/usr/lib/mon/alert.d/pushover.alert':
     ensure  => present,
     source  => 'puppet:///modules/mon/pushover.alert'
  }
}
