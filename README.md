# tcpwrappers

This is a tcpwrappers module intended to configure simple allow/deny rules.

This is provided as-is, YMMV.  If you're in Vagrant, make sure to include at least an allow for the "sshd" service.


## Examples

Just include the module:

```
include tcpwrappers
```

Include the module, and create "allow all" or "deny all" defaults:
(Note: these rules will not be removed if you define other allow or deny rules.)

```
class { 'tcpwrappers':
  default_deny_all  => true
}
```

Allow a service from an address/range (if not using default_allow_all):

```
tcpwrappers::allow { 'local_sshd':
  service  => 'sshd',
  address  => '192.168.1.0/24',
}
```

Deny a service from an address/range (if not using default_allow_all):

```
tcpwrappers::deny { 'local_ftp':
  service  => 'ftpd',
  address  => '192.168.2.0/255.255.255.0',
}
```


## Contact

nospam@macwebb.com

If you send email, please include "sharumpe-tcpwrappers" in the subject line.
