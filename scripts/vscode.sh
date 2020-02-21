#!/bin/bash -eux

echo "==> Installing VSCode..."
# Install VSCode
rpm --import https://packages.microsoft.com/keys/microsoft.asc

cat <<-EOF > /etc/yum.repos.d/vscode.repo
[vscode]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

dnf install -y code

# Install VSCode Extensions
# code --install-extension getgauge.gauge --user-data-dir /home/vagrant/.vscode-root-user
# code --install-extension mauve.terraform --user-data-dir /home/vagrant/.vscode-root-user
# code --install-extension ms-azure-devops.azure-pipelines --user-data-dir /home/vagrant/.vscode-root-user
# code --install-extension ms-azuretools.vscode-docker --user-data-dir /home/vagrant/.vscode-root-user
# code --install-extension ms-mssql.mssql --user-data-dir /home/vagrant/.vscode-root-user
# code --install-extension ms-python.python --user-data-dir /home/vagrant/.vscode-root-user
# code --install-extension ms-vscode.azure-account --user-data-dir /home/vagrant/.vscode-root-user
# code --install-extension ms-vscode.azurecli --user-data-dir /home/vagrant/.vscode-root-user
# code --install-extension ms-vscode.csharp --user-data-dir /home/vagrant/.vscode-root-user
# code --install-extension mtxr.sqltools --user-data-dir /home/vagrant/.vscode-root-user
# code --install-extension vector-of-bool.gitflow --user-data-dir /home/vagrant/.vscode-root-user
