class snmp::windows::install {

  dism { 'SNMP':
    ensure    => present,
    norestart => true,
  }

}
