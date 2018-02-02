class snmp {

  if $facts['kernel'] == 'Linux' {
 	
    contain snmp::linux::install

    Class['::snmp::linux::install']

}
  }
  elsif $facts['kernel'] == 'Windows' {

    contain snmp::windows::install

    Class['::snmp::windows::install']

  }
  else {
    warning('This snmp module does not recognize your kernel')
  }

}
