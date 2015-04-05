class buildtools {
  package {'cowbuilder':
    ensure => present,
  }
  
  package {'git-buildpackage':
    ensure => present,
  }

  file {'/home/vagrant/.pbuilderrc':
    ensure => present,
    owner  => 'vagrant',
    group  => 'vagrant',
    source => 'puppet:///modules/buildtools/pbuilderrc',
  }

  file {'/home/vagrant/.gbp.conf':
    ensure => present,
    owner  => 'vagrant',
    group  => 'vagrant',
    source => 'puppet:///modules/buildtools/gbp.conf'
  }

  exec {'create-base-wheezy':
    creates     => '/var/cache/pbuilder/base-wheezy.cow',
    environment => 'DIST=wheezy',
    command     => 'git-pbuilder create',
    user        => 'vagrant',
    path        => ['/usr/bin','/bin'],
    require     => [Package['cowbuilder'],
                    Package['git-buildpackage'],
                    File['/home/vagrant/.pbuilderrc'],
                    File['/home/vagrant/.gbp.conf'],
                    ]
  }

  exec {'update-base-wheezy':
    command     => 'git-pbuilder update',
    environment => 'DIST=wheezy',
    user        => 'vagrant',
    path        => ['/usr/bin','/bin'],
    onlyif      => 'test -d /var/cache/pbuilder/base-wheezy.cow',
    require     => [Package['cowbuilder'],
                    Package['git-buildpackage'],
                    File['/home/vagrant/.pbuilderrc'],
                    File['/home/vagrant/.gbp.conf'],
                    ]
  }
}
