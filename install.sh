#!/bin/sh
#
# Installation script

# browser integration
cp resources/mimeTypes.rdf /home/user/.mozilla/firefox/default.profile/

# print-server
cp bin/netcat_server.sh /usr/local/sbin/

# print-proxy
cp bin/print /usr/lib/cgi-bin/

# print-client
cp bin/print.rb /home/user/
cp bin/print_via_cgi.rb /home/user/

# startup script
cp resources/rc.local /etc/

