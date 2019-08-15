Vagrant.configure(2) do |config|
  config.vm.box = "devops/fedora28-iac-dev-ws"
  config.vm.box_url = file:///box/virtualbox/vagrant-virtualbox-fedora28-v20190807145922.box

  config.vm.provider "virtualbox" do |vb|
    vb.name = fedora30-iac-dev-ws
    vb.gui = true
    vb.memory = "4096"
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["setextradata", "global", "GUI/SuppressMessages", "all"]
  end
end
