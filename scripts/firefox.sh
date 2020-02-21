#!/bin/bash -eux

echo "==> Installing Firefox..."
# Install packages
dnf install -y firefox

# Firefox configuration

firefox_config_file=/usr/lib64/firefox/browser/defaults/preferences/firefox-redhat-default-prefs.js

# A global configuration file for Firefox exists so a few settings will need to
# be changed:
# browser.startup.homepage -> "about:blank"
# browser.newtabpage.pinned -> true

sed -i 's/\(pref("browser.startup.homepage",\).*/\1 "about:blank");/' $firefox_config_file
sed -i 's/\(pref("browser.newtabpage.pinned",\).*/\1 true);/' $firefox_config_file

# This setting is not in the default config so it's being appended.
# startup.homepage_welcome_url -> "about:blank"

echo 'pref("startup.homepage_welcome_url", "about:blank");' >> $firefox_config_file
echo 'pref("datareporting.healthreport.uploadEnabled", false);' >> $firefox_config_file
echo 'pref("datareporting.healthreport.service.enabled", false);' >> $firefox_config_file
echo 'pref("datareporting.healthreport.service.firstRun", false);' >> $firefox_config_file