# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.host_name = 'builder'
  config.vm.network 'private_network', type: :dhcp
  config.vm.box = "puphpet/debian75-x64"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'provision/manifests'
    puppet.module_path = 'provision/modules'
  end
end
