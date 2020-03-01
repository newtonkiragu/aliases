#!/bin/bash

cd
git clone https://github.com/newtonkiragu/.aliases/
cd .aliases
chmod +x install.sh
./install.sh
echo
echo "================================"
echo
echo 'Please type in your password when prompted to set autorefresh your aliases every month'
echo
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
echo 'We cool fam, you now have aliases. Please open a new instance of your terminal to start using your aliases.'
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
echo 'We cool fam, you now have aliases. Please open a new instance of your terminal to start using your aliases.'
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
echo 'We cool fam, you now have aliases. Please open a new instance of your terminal to start using your aliases.'
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
reload
