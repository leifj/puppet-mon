class mon::base {
  include concat::setup
  concat {'/etc/mon/mon.cf':
    owner => root,
    group => root,
    mode  => '0644'
  }
  service {'mon':
    ensure  => running,
    require => Package['mon']
  }
  concat::fragment {'moncf_header':
    target  => '/etc/mon/mon.cf',
    content => template('mon/header.erb'),
    order   => 01
  }
  concat::fragment {'moncf_hostgroups':
    target  => '/etc/mon/mon.cf',
    content => template('mon/hostgroups.erb'),
    order   => 10
  }
}
