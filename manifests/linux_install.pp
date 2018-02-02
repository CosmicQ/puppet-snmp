class snmp::linux_install {

  $agent_name = $facts['os']['family'] ? {
    /^(Debian|Ubuntu)$/: => 'snmpd',
    default:             => 'net-snmp-agent',
  }

  package { 'snmp-agent':
    ensure => installed,
    name   => $agent_name,
  }

}