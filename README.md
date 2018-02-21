# snmp

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with snmp](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with snmp](#beginning-with-snmp)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Known Issues - Current bugs and problems](#issues)

## Description

The SNMP module is meant to be a simple way to make sure the SNMP agent is installed,
configured, and running on both Linux and Windows clients.  The focus at this time is
just to make sure that SNMP v2c is configured.  SNMP v3 will be coming later.

## Setup

### Setup Requirements

This module depends on a few others (mostly because of Windows), so if you are setting
up your Puppetfile, it should look like:

```
mod 'snmp'
    :git => 'https://github.com/CosmicQ/puppet-snmp.git'
    :default_branch => 'master'
mod 'puppetlabs-stdlib'
mod 'puppetlabs-dism'
mod 'puppetlabs-registry'
```

### Beginning with snmp

Adding snmp is as simple as

```
class { '::snmp': }
```

This is configure SNMP to run with the default parameters which are:

```
  $rocommunity = 'public',
  $allowed_ip  = ['127.0.0.1'],
  $syscontact  = '',
  $syslocation = '',
  $additional  = [''],
```

## Usage

You can override the default values with your own

## Reference

Example of a hiera config:

```
snmp::rocommunity: 'notpublic'
snmp::syscontact: 'System Administrator'
snmp::syslocation: 'Data Center'
snmp::allowed_ip:
  - 127.0.0.1
  - 192.168.1.1
  - 10.1.2.3
snmp::additional:
  - trapsink localhost
  - disk /
  - pass 1.3.6.1.4.1.12345.1 /usr/local/bin/myscript.sh
```

## Known Issues

For Windows client, DISM is used to make sure SNMP is enabled and running.  There doesn't seem to be a check first
to see that it is in fact running, before taking action.  Right now, this reports that SNMP was enabled everytime 
puppet runs.

