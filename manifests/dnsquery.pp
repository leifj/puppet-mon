define mon::dnsquery($name,$server,$mail) {
   mon::hostgroup{$name: members => $server}
   mon::watch{$name:
      service => "dnsquery",
      monitor => "dns-query.monitor -n $name $server",
      mail    => $mail 
   }
}
