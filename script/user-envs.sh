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
# inside user's home. Then this variables will be loaded in any terminal
# even if it's a SSH session

rm -f \$HOME/.vars
for i in \$(env | grep '^DBUS\|^DISPLAY'); do echo \$i >> \$HOME/.vars; done

EOF

cat <<-EOF > /etc/profile.d/load-vars.sh 
# this command line loads the DBUS* and DISPLAY environment variables in any terminal
[ -f \$HOME/.vars ] && for i in \$(cat \$HOME/.vars | grep '^DISPLAY\|^DBUS');do export \$i; done

EOF
 
chmod +x /usr/local/bin/save-env-vars.sh

