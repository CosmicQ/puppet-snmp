class snmp::windows::config {

  registry_key { [
    'HKLM\SYSTEM\CurrentControlSet\\services\SNMP\Parameters\PermittedManagers',
    'HKLM\SYSTEM\CurrentControlSet\\services\SNMP\Parameters\RFC1156Agent',
    'HKLM\SYSTEM\CurrentControlSet\\services\SNMP\Parameters\ValidCommunities' ]:
    purge_values => true,
  }

  registry_value { "HKLM\SYSTEM\CurrentControlSet\\services\SNMP\Parameters\ValidCommunities\\${snmp::community}":
    ensure => present,
    type   => 'dword',
    data   => '4',
  }

  registry_value { "HKLM\SYSTEM\CurrentControlSet\\services\SNMP\Parameters\RFC1156Agent\sysContact":
    ensure => present,
    type   => 'string',
    data   => $snmp::syscontact,
  }

  registry_value { "HKLM\SYSTEM\CurrentControlSet\\services\SNMP\Parameters\RFC1156Agent\sysLocation":
    ensure => present,
    type   => 'string',
    data   => $snmp::syslocation,
  }

  $snmp::allowed_ip.each |Integer $index, String $value| {
    registry_value { "HKLM\SYSTEM\CurrentControlSet\\services\SNMP\Parameters\PermittedManagers\${index}":
      ensure => present,
      type   => 'string',
      data   => ${value},
    }
  }
}
