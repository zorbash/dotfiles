## Workstation Puppet Manifest

This directory contains puppet specific files aiming to perform an
opinionated setup of a workstation machine using Puppet.

### Instructions

1. Install librarian-puppet:

```bash
  gem install librarian-puppet
```

2. Apply the manifest

```bash
  puppet apply --modulepath=./modules init.pp
```
