define mon::zone($master,$slaves,$mail) {
   mon::watch{$name:
      service => $name,
      monitor => "dns.monitor -zone $name -master $master $slaves",
      mail    => $mail 
   }
}
