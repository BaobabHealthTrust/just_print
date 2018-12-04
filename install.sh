#!/bin/sh
#
# Installation script

#====================================================================================================================#
#                                                                                                                    #
# MAKE SURE THIS SCRIPT IS NOT RUN AS ROOT                                                                           #
#                                                                                                                    #
# RUN THIS SCRIPT AS THE USER THAT WILL BE USED TO RUN THE APPLICATION IN BROWSER                                    #
#                                                                                                                    #
#====================================================================================================================#

# browser integration
# auto-read system username and default mozilla firefox profile

# get just print directory before excuting anything else

JUST_PRINT_DIRECTORY=$(pwd)

cd /home/$USER/.mozilla/firefox/

if [[ $(grep '\[Profile[^0]\]' profiles.ini) ]]
then PROFPATH=$(grep -E '^\[Profile|^Path|^Default' profiles.ini | grep -1 '^Default=1' | grep '^Path' | cut -c6-)
else PROFPATH=$(grep 'Path=' profiles.ini | sed 's/^Path=//')
fi

echo $PROFPATH

cd $JUST_PRINT_DIRECTORY

sudo cp resources/mimeTypes.rdf /home/$USER/.mozilla/firefox/$PROFPATH/

# print-server
sudo cp bin/netcat_server.sh /usr/local/sbin/

# print-proxy
sudo cp bin/print /usr/lib/cgi-bin/

# print-client
sudo cp bin/print.rb /home/$USER/
sudo cp bin/print_via_cgi.rb /home/$USER/

# startup script
sudo cp resources/rc.local /etc/

