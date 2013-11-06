define mon::zone($master,$slaves,$mail) {
   mon::hostgroup{$name: members => $master}
   mon::watch{$name:
      service => $name,
      monitor => "dns.monitor -zone $name -master $master $slaves",
      mail    => $mail 
   }
}
