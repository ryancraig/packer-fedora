#!/bin/bash

cat <<-EOF > /etc/xdg/autostart/save-env-vars.desktop
[Desktop Entry]
Type=Application
Name=Save some session variables
Exec=/usr/local/bin/save-env-vars.sh
StartupNotify=false
NoDisplay=true
X-GNOME-Autostart-Phase=Initialization
X-KDE-autostart-phase=1
EOF

cat <<-EOF > /usr/local/bin/save-env-vars.sh
#!/bin/bash
# This script saves the DBUS* and DISPLAY environment variables in a file
# inside an user's directory in the /tmp. Then this variables will be loaded
# in any terminal even if it's a SSH session

mkdir -m 0700 /tmp/\$USER-DBUS-vars
for i in \$(env | grep '^DBUS\|^DISPLAY'); do echo \$i >> /tmp/\$USER-DBUS-vars/vars; done

EOF

cat <<-EOF > /etc/profile.d/load-vars.sh
# this command line loads the DBUS* and DISPLAY environment variables in any terminal
if [ -f /tmp/\$USER-DBUS-vars/vars ]; then
  for i in \$(cat /tmp/\$USER-DBUS-vars/vars | grep '^DISPLAY\|^DBUS');do export \$i; done
fi

EOF

chmod +x /usr/local/bin/save-env-vars.sh

