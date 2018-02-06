class snmp::windows::config {

  registry_key { [
    'HKLM\SYSTEM\CurrentControlSet\services\SNMP\Parameters\PermittedManagers',
    'HKLM\SYSTEM\CurrentControlSet\services\SNMP\Parameters\RFC1156Agent',
    'HKLM\SYSTEM\CurrentControlSet\services\SNMP\Parameters\ValidCommunities' ]:
    purge_values => true,
  }

  if $snmp::rocommunity {
    registry_value { "HKLM\\SYSTEM\\CurrentControlSet\\services\\SNMP\\Parameters\\ValidCommunities\\${snmp::rocommunity}":
      type   => dword,
      data   => '4',
    }
  }

  if $snmp::syscontact { 
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\services\SNMP\Parameters\RFC1156Agent\sysContact':
      data   => $snmp::syscontact,
    }
  }

  if $snmp::syslocation { 
    registry_value { 'HKLM\SYSTEM\CurrentControlSet\services\SNMP\Parameters\RFC1156Agent\sysLocation':
      data   => $snmp::syslocation,
    }
  }

  if $snmp::allowed_ip {
    $defaults = { ensure => present, type => 'string' }

    $snmp::allowed_ip.each |Integer $index, String $value| {
      $add_one = $index + 1
      $registry_hash = { "HKLM\\SYSTEM\\CurrentControlSet\\services\\SNMP\\Parameters\\PermittedManagers\\${add_one}" => { data => $value } }
      create_resources(registry_value,$registry_hash,$defaults)
    }
  }
}