class snmp (

  $rocommunity = 'public',
  $allowed_ip  = '127.0.0.1',
  $syscontact  = 'Sysadmin',
  $syslocation = 'Somewhere',

){

  if $facts['kernel'] == 'Linux' {
 	
    contain snmp::linux::install
    contain snmp::linux::config

    Class['::snmp::linux::install']
    -> Class['::snmp::linux::config']

  }
  elsif $facts['kernel'] == 'Windows' {

    contain snmp::windows::install

    Class['::snmp::windows::install']

  }
  else {
    warning('This snmp module does not recognize your kernel')
  }

}
