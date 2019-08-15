
# Packer Templates for Fedora

### Overview

This repository contains the solution assets to create Fedora 30 Vagrant-managed VirtualBox box using Packer.

This Fedora 30 Workstation is provisioned as a Infrastructure as Code development workstation. It includes:

* Git
* VSCode
* Remmina
* Google Chrome
* Firefox
* Docker CE (`vagrant` user is put in `docker` group)

## Current Boxes

* [Fedora 28 (64-bit)](https://atlas.hashicorp.com/inclusivedesign/boxes/fedora28)

## Building the Vagrant Boxes

```
$ hashicorp-packer build fedora{{VERSION}}.json
```

_NOTE: Replace `{{VERSION}}` with correct version number such as `28`, `29`, or `30`.  Example: `hashicorp-packer build fedora30.json`_

## Publish box to Vagrant Cloud
$ curl 'https://vagrantcloud.com/api/v1/box/USERNAME/BOX_NAME/version/VERSION/provider/PROVIDER_NAME/upload?access_token=ACCESS_TOKEN'

*Example*
```
$ curl 'https://vagrantcloud.com/api/v1/box/ryancraig/fedora-iac-dev-workstation/version/1.0.0/provider/virtualbox/upload?access_token=oVThR4H0usQIQg.atlasv1.v08CamGyr4Dg4eUiyzWubPRCAGTZLNEau08ozYzPoczhoUSnGLOoyIzl0yYAl75Huqc'
```