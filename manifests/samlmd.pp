define mon::samlmd($uri,$cert,$mail) {
  mon::hostgroup{$name: members => 'localhost'}
  mon::watch{$name: service => "$name", monitor => "samlmd.monitor $uri $cert", mail => $mail}
}
