class snmp::linux::config {

  $stuff = ""

  $snmp::allowed_ip.each |String $ip| {

    $stuff = "${stuff}rocommunity ${snmp::rocommunity} ${ip}\nsyscontact ${snmp::syscontact}\nsyslocation ${snmp::syslocation}\n"

  }

  file { 'snmpd.conf':
    ensure  => present,
    path    => '/etc/snmp/snmpd.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => $stuff,
  }

}
