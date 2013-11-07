class mon::debian inherits mon::base {
  package {'mon': ensure => installed }
  package {'libconvert-ber-perl': ensure => installed }
  class { 'python':
    version    => 'system',
    dev        => true,
    virtualenv => true,
    gunicorn   => false,
  }
  python::pip {'python-pushover': ensure => present}
  python::pip {'python-requests': ensure => present}
  Service['mon'] {
    pattern => '/usr/sbin/mon',
    restart => '/usr/sbin/service mon restart',
  }
  file {'/usr/lib/mon/alert.d/pushover.alert':
     ensure  => present,
     mode    => '0755',
     source  => 'puppet:///modules/mon/pushover.alert'
  }
  file {'/usr/lib/mon/mon.d/dns.monitor':
     ensure  => present,
     mode    => '0755',
     source  => 'puppet:///modules/mon/dns.monitor'
  }
  if ! defined(Package['opensaml2-tools']) {
     package {'opensaml2-tools': ensure => installed}
   }
   file {'/usr/lib/mon/mon.d/samlmd.monitor':
     ensure  => present,
     mode    => '0755',
     source  => 'puppet:///modules/mon/samlmd.monitor'
  }
  file {'/usr/lib/mon/mon.d/uri.monitor':
     ensure  => present,
     mode    => '0755',
     source  => 'puppet:///modules/mon/uri.monitor'
  }
}
