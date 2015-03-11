define mon::vuri($uri,$pattern,$hosts,$mail) {
  mon::hostgroup{$name: members => $hosts}
  mon::watch{$name: service => "uri", monitor => "vuri.monitor $uri \"$pattern\" $hosts", mail => $mail}
}
