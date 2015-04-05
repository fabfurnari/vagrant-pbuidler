class bash {
  file {'/home/vagrant/.bashrc':
    ensure => present,
    owner  => 'vagrant',
    group  => 'vagrant',
    source => 'puppet:///modules/bash/bashrc',
  }
}
