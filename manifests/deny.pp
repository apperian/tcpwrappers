define tcpwrappers::deny
(
  $service,
  $address,
  $args = undef
)
{
  # Source can contain a mask, as well. Split that off.
  $parts = split($address, '/')
  $addr = $parts[0]
  $mask = $parts[1]

  # Validate the inputs
  validate_re( $addr, 'ALL|^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$' )
  if ( $mask ) {
    validate_re( $mask, '^\d+$|^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$' )
  }
  validate_string( $service )
  validate_string( $args )

  if ( $args ) {
    $output = join( [ $service, $address, $args ], ' : ' )
  }
  else {
    $output = join( [ $service, $address ], ' : ' )
  }

  concat::fragment{ "tcpwrappers_deny_${name}":
    target  => $tcpwrappers::deny_path,
    order   => 10,
    content => "# ${name}\n${output}\n",
  }
}
