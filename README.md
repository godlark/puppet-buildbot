# rji-buildbot [![Build Status](https://travis-ci.org/rji/puppet-buildbot.svg?branch=master)](https://travis-ci.org/rji/puppet-buildbot)
A Puppet module to manage a [Buildbot][1] CI installation.

  * Project page: <https://github.com/rji/puppet-buildbot>
  * Puppet Forge: <https://forge.puppetlabs.com/rji/buildbot>

## Overview
This module manages masters and slaves in a Buildbot CI system. It installs
`buildbot` and `buildbot-slave` via pip, manages configuration files, and
manages the service with Buildbot's own methods (via the `buildbot` and
`buildbot-slave` executables).

## Compatibility
This module was developed to work with Debian 7 "Wheezy" and CentOS 6. It may
work on other Debian and EL-based distros, provided the system-wide Python is
version 2.6 or 2.7.

## Usage
### Prerequisites
In order to install `python-pip` on CentOS / EL-based distros, you'll need to
have the EPEL repos configured. I recommend the [stahnma/epel][2] module.

If you're not already managing your Apt configuration with Puppet, I recommend
using the [puppetlabs/apt][3] module to ensure `apt-get update` runs prior
to this module installing the `python-pip` package.

### Masters
#### Parameters
  * `project` (required): the name of the project this Buildbot install is
  supporting.
  * `project_url` (required): the project's URL.
  * `slave_port` (optional): the port on the master that slaves will connect
  to. Defaults to '9989'.

```puppet
    class { '::buildbot::master':
        project    => 'Example',
        projecturl => 'http://www.example.com',
        slave_port => '9989',
    }
```

### Slaves
Each slave will export a resource with its `name`, `password`, and `max_builds`.
Those resources will then be collected on the Buildbot master and be used to
populate the config file.

#### Parameters
  * `master` (required): the hostname or IP of the master this slave will
  connect to.
  * `master_port` (optional): the port on the master for the slave to connect
  to. Defaults to '9989'.
  * `slave_name` (optional): the name to use for this slave. Defaults to the
  FQDN returned by Facter.
  * `password` (optional): the password to connect the slave to the
  master. This will default to 'Buildbot-slave-pw'.
  * `admin` (optional): name and e-mail address of the sysadmin responsible
  for the build slave.
  * `description` (optional): a description of the build slave.
  * `max_builds` (optional): the maximum number of builds to execute on the
  given build slave. Defaults to `$::processorcount * 2`.

```puppet
    class { '::buildbot::slave':
        master      => 'buildbot.example.com',
        master_port => '9989',
        slave_name  => 'example-slave',
        password    => 'top-secret-pass',
        admin       => 'Admin <admin@example.com>',
        description => 'Python build slave.',
        max_builds  => '4',
    }
```

<!-- reference links -->
[1]: http://buildbot.net
[2]: https://forge.puppetlabs.com/stahnma/epel
[3]: https://forge.puppetlabs.com/puppetlabs/apt

