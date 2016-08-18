#!/bin/bash -eux

if [[ $PACKER_BUILDER_TYPE =~ vmware ]]; then
    echo "==> Installing VMware Tools"
    ${PKG_MGR} -y install open-vm-tools open-vm-tools-desktop
    mkdir /mnt/hgfs
fi

if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
    echo "==> Installing VirtualBox guest additions"

    # Assume that we've installed all the prerequisites:
    # kernel-headers-$(uname -r) kernel-devel-$(uname -r) gcc make perl
    # from the install media via ks.cfg
    # Except on Fedora 22 (which uses dnf)
    if [ "${PKG_MGR}" == "dnf" ]; then
        ${PKG_MGR} -y install kernel-headers-$(uname -r) kernel-devel-$(uname -r) gcc make perl
    fi

    VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
    mount -o loop /home/vagrant/VBoxGuestAdditions_${VBOX_VERSION}.iso /mnt
    sh /mnt/VBoxLinuxAdditions.run --nox11
    umount /mnt
    rm -rf /home/vagrant/VBoxGuestAdditions_${VBOX_VERSION}.iso
    rm -f /home/vagrant/.vbox_version

    if [[ $VBOX_VERSION = "4.3.10" ]]; then
        ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
    fi
fi

if [[ $PACKER_BUILDER_TYPE =~ parallels ]]; then
    echo "==> Installing Parallels tools"

    mount -o loop /home/vagrant/prl-tools-lin.iso /mnt
    /mnt/install --install-unattended-with-deps
    umount /mnt
    rm -rf /home/vagrant/prl-tools-lin.iso
    rm -f /home/vagrant/.prlctl_version
fi

echo "==> Removing packages needed for building guest tools"
${PKG_MGR} -y remove gcc cpp kernel-devel kernel-headers perl
