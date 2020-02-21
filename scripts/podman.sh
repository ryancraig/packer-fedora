#!/bin/bash -eux

echo "==> Installing Podman..."
dnf install -y podman
rpm -qi podman
podman info
