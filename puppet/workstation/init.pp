class essential_packages {
  package { ['build-essential',
              'git',
              'htop',
              'iotop',
              'openssl',
              'imagemagick',
              'wdiff',
              'tor']:
    ensure => installed,
  }
}

class ruby_packages {
  package { ['libffi-dev',
              'libgdbm-dev',
              'libreadline6-dev',
              'libyaml-dev',
              'zlib1g-dev',
              'libssl-dev',
              'libxml2-dev',
              'libxslt1-dev',
              'libcurl4-openssl-dev']:
    ensure => installed,
  }
}

class db_packages {
  package { ['sqlite3']:
    ensure => installed,
  }
}

class dev_packages {
  package { ['zsh',
             'vim-nox',
             'tig',
             'terminator',
             'i3',
             'pal',
             'calcurse',
             'curl',
             'finch',
             'tree',
             'meld',
             'thunar',
             'graphviz',
             'gimp',
             'xclip',
             'ttyrec',
             'moc',
             'ack-grep',
             'locate']:
    ensure => installed,
  }
}

include essential_packages
include ruby_packages
include db_packages
include dev_packages
