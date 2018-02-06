class snmp::linux::install {

  $agent_name = $facts['os']['family'] ? {
    /^(Debian|Ubuntu)$/ => 'snmpd',
    default             => 'net-snmp',
  }

  package { 'snmp-agent':
    ensure => installed,
    name   => $agent_name,
  }

}