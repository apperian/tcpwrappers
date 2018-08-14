define tcpwrappers::allow
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
  validate_re( $addr, 'ALL|LOCAL|UNKNOWN|KNOWN|PARANOID|^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$|^\w+\.[\w\.]+$' )
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

  concat::fragment{ "tcpwrappers_allow_${name}":
    target  => $tcpwrappers::allow_path,
    order   => 10,
    content => "# ${name}\n${output}\n",
  }
}
