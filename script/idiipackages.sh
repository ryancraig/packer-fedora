#!/bin/bash -eux

# vagrant requirements
${PKG_MGR} install -y ansible curl bzip2 deltarpm gcc git kernel-devel kernel-headers make net-tools nfs-utils orca perl sqlite-devel sudo tar wget yum-utils zlib-devel
# The remaining packages are GPII Framework dependencies - https://github.com/gpii/linux
${PKG_MGR} install -y nodejs-grunt-cli glib2-devel PackageKit-glib-devel json-glib-devel libXrandr-devel libXrender-devel libX11-devel xorg-x11-proto-devel alsa-lib-devel tuxguitar
