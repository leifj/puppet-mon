define mon::samlmd($uri,$cert,$mail) {
  mon::hostgroup{$name: members => 'localhost'}
  mon::watch{$name: service => "samlmd", monitor => "samlmd.monitor $uri $cert", mail => $mail}
}
