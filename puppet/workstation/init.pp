class essential_packages {
  package { ['build-essential',
              'git',
              'htop',
              'iotop',
              'openssl',
              'imagemagick',
              'wdiff',
              'gem2deb',
              'pbuilder',
              'mc', # provides midnight commander
              'lm-sensors', # provides sensors (for hw temperature monitoring)
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
  package { ['sqlite3',
             'libsqlite3-dev',
             'libpq-dev',
             'postgresql-client',
             'postgresql-client-common']:
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
             'locate',
             'libreoffice-base']:
    ensure => installed,
  }
}

class printer_packages {
  package { ['hplip',
             'cups']:
    ensure => installed,
  }
}

class hobby_packages {
  package { ['exifprobe',
             'nethack-x11',
             'mtp-tools']:
    ensure => installed,
  }
}

class npm_packages {
  package { ['coffee-script',
             'bower',
             'LiveScript',
             'grunt']:
    ensure   => present,
    provider => 'npm',
  }
}

include nodejs
include essential_packages
include ruby_packages
include db_packages
include dev_packages
include npm_packages
include printer_packages
include hobby_packages