class tcpwrappers::install
inherits tcpwrappers
{

  package { $tcpwrappers::package_name :
    ensure => $tcpwrappers::package_ensure,
    before => Concat[ $tcpwrappers::allow_path,
                      $tcpwrappers::deny_path ],
  }

}
