class snmp::windows {
	
  contain snmp::windows::install.pp

  Class['::snmp::windows::install']

}