class mon::debian inherits mon::base {
  package {'mon': ensure => installed }
  class { 'python':
    version    => 'system',
    dev        => true,
    virtualenv => true,
    gunicorn   => false,
  }
  python::pip {'python-pushover': ensure => present}
  Service['mon'] {
    pattern => '/usr/sbin/mon',
    restart => 'service mon restart',
  }
  file {'/usr/lib/mon/alert.d/pushover.alert':
     ensure  => present,
     mode    => '0755',
     source  => 'puppet:///modules/mon/pushover.alert'
  }
}
