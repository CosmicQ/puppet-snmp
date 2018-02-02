class snmp::linux {
	
  contain snmp::linux::install.pp

  Class['::snmp::linux::install']

}