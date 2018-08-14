class tcpwrappers
(
  $defaultAllowAll   = $tcpwrappers::params::default_allow_all,
  $defaultDenyAll    = $tcpwrappers::params::default_deny_all,
  $default_allow_all = $tcpwrappers::params::default_allow_all,
  $default_deny_all  = $tcpwrappers::params::default_deny_all,
  $config_path       = $tcpwrappers::params::config_path,
  $allow_path        = $tcpwrappers::params::allow_path,
  $deny_path         = $tcpwrappers::params::deny_path,
  $allow_message     = $tcpwrappers::params::allow_message,
  $deny_message      = $tcpwrappers::params::deny_message,
  $package_ensure    = $tcpwrappers::params::package_ensure,
  $package_name      = $tcpwrappers::params::package_name
)
inherits tcpwrappers::params
{

  validate_bool($defaultAllowAll)
  validate_bool($defaultDenyAll)
  validate_bool($default_allow_all)
  validate_bool($default_deny_all)
  validate_string($config_path)
  validate_string($allow_path)
  validate_string($deny_path)
  validate_string($allow_message)
  validate_string($deny_message)
  validate_string($package_ensure)
  validate_string($package_name)

  contain tcpwrappers::install
  contain tcpwrappers::config

}
