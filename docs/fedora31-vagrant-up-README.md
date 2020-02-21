# Fedora 31 Development Workstation
## Overview

This Vagrant box was built using HashiCorp Packer. The github project is ryancraig/packer-fedora. This project started as a fork of idi-ops/packer-fedora.

This box is currently only available for the VirtualBox provider.

This Fedora 31 Workstation is provisioned as a base box that can easily become an Infrastructure as Code development workstation. It includes:

* Git
* VSCode
* Remmina
* Google Chrome
* Firefox
* Podman (in place of Docker)
* Python3

Most non-essential packages have been explicitly omitted during the box creation process.

The only user available is vagrant. Password is vagrant. Autologin is enabled. GUI mode is set to true. SSH is enabled. You may SSH using user and password or the vagrant_insecure_rsa key.

If you have any concerns, find problems, etc let me know at [github: ryancraig/packer-fedora](https://github.com/ryancraig/packer-fedora). I'll do my best to answer and act. You're welcomed to contribute to the project as well.

# Checksum
sha256 caf55ca414423f39b7444ab83afb8d5585d61eefb576a212d6804a4f5dd44631

# Changelog
## 1.0.0
* Initial release