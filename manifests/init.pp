class snmp (

  $rocommunity = 'public',
  $allowed_ip  = ['127.0.0.1'],
  $syscontact  = 'Sysadmin',
  $syslocation = 'Somewhere',
  $additional  = [''],

){

  if $facts['kernel'] == 'Linux' {
 	
    contain snmp::linux::install
    contain snmp::linux::config
    contain snmp::linux::service

    Class['::snmp::linux::install']
    -> Class['::snmp::linux::config']
    ~> Class['::snmp::linux::service']

  }
  elsif $facts['kernel'] == 'Windows' {

    contain snmp::windows::install
    contain snmp::windows::config

    Class['::snmp::windows::install']
    -> Class['::snmp::windows::config']
    
  }
  else {
    warning('This snmp module does not recognize your kernel')
  }

}
