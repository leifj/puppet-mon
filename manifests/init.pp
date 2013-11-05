class mon {
  case $::operatingsystem {
    'Debian','Ubuntu': { include mon::debian }
    default          : { fail "Unknown ${::operatingsystem}" }
  }
}
