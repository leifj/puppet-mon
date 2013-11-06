class mon::debian inherits mon::base {
  package {'mon': ensure => installed }
  Service['mon'] {
    pattern => '/usr/sbin/mon',
    restart => 'service mon restart',
  }
}
