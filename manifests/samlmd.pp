define mon::samlmd($uri,$cert,$mail) {
   if ! defined(Package['opensaml-tools']) {
     package {'opensaml-tools': ensure => installed}
   }
   file {'/usr/lib/mon/mon.d/samlmd.monitor':
     ensure  => present,
     mode    => '0755',
     source  => 'puppet:///modules/mon/samlmd.monitor'
  }
  mon::hostgroup{$name: members => 'localhost'}
  mon::watch{$name: service => "$name", monitor => "samlmd.monitor $uri $cert", mail => $mail}
}
