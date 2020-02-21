#!/bin/bash -eux

echo "==> Installing Docker CE..."
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
dnf install -y docker-ce
systemctl enable docker
groupadd docker
usermod -a -G docker vagrant
