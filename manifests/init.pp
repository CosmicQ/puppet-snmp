class snmp {

  if $facts['kernel'] == 'Linux' {
    include snmp::linux
  }
  elsif $facts['kernel'] == 'Windows' {
    include snmp::windows
  }
  else {
    warning('This snmp module does not recognize your kernel')
  }

}
