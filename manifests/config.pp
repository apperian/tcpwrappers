class tcpwrappers::config
inherits tcpwrappers
{

  # Set up the concat objects
  concat { $tcpwrappers::allow_path:
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  concat { $tcpwrappers::deny_path:
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  # Drop in a message stating how the files are managed, so that folks
  # don't get surprised when the file changes out from under them.
  concat::fragment { 'tcpwrappers_default_allow_msg':
    target  => $tcpwrappers::allow_path,
    order   => 01,
    content => $tcpwrappers::allow_message,
  }
  concat::fragment { 'tcpwrappers_default_deny_msg':
    target  => $tcpwrappers::deny_path,
    order   => 01,
    content => $tcpwrappers::deny_message,
  }

  # Set a default 'allow everything' file.
  if ( $tcpwrappers::default_allow_all ) {
    tcpwrappers::all { 'default_allow_all':
      service => 'ALL',
      address => 'ALL',
    }
  }

  # Set a default 'deny everything' file.
  if ( $tcpwrappers::default_deny_all ) {
    tcpwrappers::deny { 'default_deny_all':
      service => 'ALL',
      address => 'ALL',
    }
  }

}
