class snmp::linux::config {

  $build_community = $snmp::allowed_ip.map |$ip| { "rocommunity ${snmp::rocommunity} ${ip}" }
  $flat_community = join($build_community,"\n")

  $flat_additional = join($snmp::additional,"\n")

  $snmp_content = "${goflat}\nsyscontact ${snmp::syscontact}\nsyslocation ${snmp::syslocation}\n${flat_additional}\n"

  file { 'snmpd.conf':
    ensure  => present,
    path    => '/etc/snmp/snmpd.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => $snmp_content,
  }

}
