
# Packer-Fedora

### Overview

This project contains all of the assets required to successfully build a Fedora Vagrant box. Currently the only supported Vagrant provider is `virtualbox`. Hashicorp Packer is employed to build and package this Vagrant box.

This Fedora Workstation is provisioned as a base box that can easily be further provisioned as an Infrastructure as Code development workstation. It includes:

* Git
* VSCode
* Remmina
* Google Chrome
* Firefox
* Docker CE (`vagrant` user is put in `docker` group)
* Python3

## Available Vagrant Boxes
* [Fedora 30 (64-bit)](https://app.vagrantup.com/ryancraig/boxes/fedora30-dev-ws)

## How to build a Vagrant Box

### Prerequisites

Install according to vendor instuctions:

* [Hashicorp Vagrant](https://www.vagrantup.com/)
* [Hashicorp Packer](https://www.packer.io/)
* [Oracle VirtualBox](https://www.virtualbox.org/)

*NOTE: The `VirtualBox Extension Pack` is not necessary and should not be installed unless you are willing to pay licensing fees to Oracle for its use!*

### Execute Packer build

Execute:

```
packer build fedora{{ VERSION }}.json
```

*NOTE: Replace `{{ VERSION }}` with correct version number such as `30`.  Example: `packer build fedora30.json`*

This Vagrant box build process can take awhile. This is especially true the first time you execute this build as Packer has to go download the specified Fedora ISO. The fetched ISO is put in `./packer_cache` so that Packer only has to download the ISO once.

## Publish box to Vagrant Cloud
If you wish to publish your Vagrant box to the Vagrant Cloud, read and follow the directions provided by Hashicorp:

[Hashicorp Vagrant Documentation: Create and Publish a Vagrant Box to Vagrant Cloud](https://www.vagrantup.com/docs/vagrant-cloud/boxes/create.html)

## External References

* [Hashicorp Vagrant Documentation: Create and Publish a Vagrant Box to Vagrant Cloud](https://www.vagrantup.com/docs/vagrant-cloud/boxes/create.html)
* [Hashicorp Vagrant](https://www.vagrantup.com/)
* [Hashicorp Packer](https://www.packer.io/)
* [Oracle VirtualBox](https://www.virtualbox.org/)