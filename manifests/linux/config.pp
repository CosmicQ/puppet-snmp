class snmp::linux::config {

  $stuff = "rocommunity ${rocommunity} ${allowed_ip}
        syscontact ${syscontact}
        syslocation ${syslocation}
        "

  file { 'snmpd.conf':
    ensure  => present,
    path    => '/etc/snmp/snmpd.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => $stuff,
  }

}
