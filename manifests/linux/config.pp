class snmp::linux::config {

  $stuff = "rocommunity ${snmp::rocommunity} ${snmp::allowed_ip}\nsyscontact ${snmp::syscontact}\nsyslocation ${snmp::syslocation}\n"

  file { 'snmpd.conf':
    ensure  => present,
    path    => '/etc/snmp/snmpd.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => $stuff,
  }

}
