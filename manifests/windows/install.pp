class snmp::windows::install {

  dism { 'SNMP':
    ensure => present,
  }

}
