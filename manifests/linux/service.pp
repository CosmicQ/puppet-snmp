class snmp::linux::service {

  service { 'snmpd':
    ensure => running,
    enable => true,
  }

}
