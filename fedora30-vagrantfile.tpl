Vagrant.configure(2) do |config|
  config.vm.box = "ryancraig/fedora30-dev-ws"
  config.vm.box_url = "file:///box/virtualbox/vagrant-virtualbox-fedora30-v20200221.box"

  config.vm.provider "virtualbox" do |vb|
    #vb.name = "fedora30-iac-dev-ws"
    vb.gui = true
    vb.memory = "4096"
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["setextradata", "global", "GUI/SuppressMessages", "all"]
  end
end
