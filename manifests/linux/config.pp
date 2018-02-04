class snmp::linux::config {

  $build_array = $snmp::allowed_ip.map |$ip| { "rocommunity ${snmp::rocommunity} ${ip}" }

  $goflat = join($build_array,"\n")

  $snmp_content = "${goflat}\nsyscontact ${snmp::syscontact}\nsyslocation ${snmp::syslocation}\n"

  }

  file { 'snmpd.conf':
    ensure  => present,
    path    => '/etc/snmp/snmpd.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => $snmp_content,
  }

}
