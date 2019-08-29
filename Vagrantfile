Vagrant.configure(2) do |config|
  config.vm.box = "ryancraig/fedora30-dev-ws"
  config.vm.box_url = "file:///home/us20428@melaleuca.net/scratch/_git/azp-repos/devtestlabs-xyz/packer-fedora/box/virtualbox/vagrant-virtualbox-fedora30-v20190807145922.box"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "4096"
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["setextradata", "global", "GUI/SuppressMessages", "all"]
  end
end
