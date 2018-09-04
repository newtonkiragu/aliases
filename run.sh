#!/bin/bash

cd
git clone https://github.com/newtonkiragu/aliases/
cd aliases
chmod +x install.sh
./install.sh
sudo su
echo '@monthly cd ~/aliases/ && git pull origin master' >> /etc/cron.d/aliases
function reload() {
if [ -f $HOME/.bashrc ]; then
source $HOME/.bashrc
echo '
   #    #       ###    #     #####  #######  #####
  # #   #        #    # #   #     # #       #     #
 #   #  #        #   #   #  #       #       #
#     # #        #  #     #  #####  #####    #####
####### #        #  #######       # #             #
#     # #        #  #     # #     # #       #     #
#     # ####### ### #     #  #####  #######  #####

'
echo 'We cool fam, you now have aliases.'
elif [ -f $HOME/.zshrc ]; then
 source $HOME/.zshrc
 echo '
   #    #       ###    #     #####  #######  #####
  # #   #        #    # #   #     # #       #     #
 #   #  #        #   #   #  #       #       #
#     # #        #  #     #  #####  #####    #####
####### #        #  #######       # #             #
#     # #        #  #     # #     # #       #     #
#     # ####### ### #     #  #####  #######  #####

'
echo 'We cool fam, you now have aliases.'
elif [ -f $HOME/.bash_profile ]; then
source $HOME/.bash_profile
echo '
   #    #       ###    #     #####  #######  #####
  # #   #        #    # #   #     # #       #     #
 #   #  #        #   #   #  #       #       #
#     # #        #  #     #  #####  #####    #####
####### #        #  #######       # #             #
#     # #        #  #     # #     # #       #     #
#     # ####### ### #     #  #####  #######  #####

'
echo 'We cool fam, you now have aliases.'
else
echo '
   #    #       ###    #     #####  #######  #####
  # #   #        #    # #   #     # #       #     #
 #   #  #        #   #   #  #       #       #
#     # #        #  #     #  #####  #####    #####
####### #        #  #######       # #             #
#     # #        #  #     # #     # #       #     #
#     # ####### ### #     #  #####  #######  #####

'
echo 'please reload your terminal fam.'
fi
}

cd
# Execute the function
reload
