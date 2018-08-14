class tcpwrappers::params
{
  $default_allow_all = false
  $default_deny_all  = false

  $package_ensure = 'present'
  $package_name = $::osfamily ? {
    'Debian' => 'tcpd',
    'RedHat' => 'tcp_wrappers',
    'Suse'   => 'tcpd',
  }

  $config_path   = '/etc'
  $allow_path    = "${config_path}/hosts.allow"
  $deny_path     = "${config_path}/hosts.deny"
  $allow_message = "# Managed by Puppet. Changes will be lost!\n"
  $deny_message  = "# Managed by Puppet. Changes will be lost!\n"
}
