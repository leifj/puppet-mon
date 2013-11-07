define mon::uri($uri,$pattern,$mail) {
  mon::hostgroup{$name: members => 'localhost'}
  mon::watch{$name: service => "uri", monitor => "uri.monitor $uri \"$pattern\"", mail => $mail}
}
