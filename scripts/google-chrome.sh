#!/bin/bash -eux

# Install Google Chrome
rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub

cat <<-EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

# Install packages
dnf install -y google-chrome-stable

# Chrome configuration

mkdir -p /etc/opt/chrome/policies/{managed,recommended}

# Due to the following issues a specific combination of settings below are
# required:
# https://code.google.com/p/chromium/issues/detail?id=138983#c6
# https://code.google.com/p/chromium/issues/detail?id=306104#c13

# A default global configuration file doesn't exist for Chrome so a new will be
# created.

cat <<-EOF > /etc/opt/chrome/policies/managed/defaults.json
{
  "RestoreOnStartup": 0,
  "HomepageIsNewTabPage": false,
  "HomepageLocation": "about:blank",
  "DefaultBrowserSettingEnabled": false,
  "MetricsReportingEnabled": false,
  "DefaultSearchProviderEnabled": false
}
EOF

