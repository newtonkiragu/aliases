#!/bin/bash

function addbashaliases() {
if [ -f $HOME/.bashrc ]; then
cat >> $HOME/.bashrc << EOT

# location of bash aliases
if [ -f $HOME/.aliases/.bash_aliases ]; then
source $HOME/.aliases/.bash_aliases
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
echo 'please re-install bash aliases from https://github.com/newtonkiragu/aliases'
fi


EOT
source $HOME/.bashrc
elif [ -f $HOME/.zshrc ]; then
cat >> $HOME/.zshrc << EOT

# location of bash aliases
if [ -f $HOME/.aliases/.bash_aliases ]; then
source $HOME/.aliases/.bash_aliases
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
echo 'please re-install bash aliases from https://github.com/newtonkiragu/.aliases'
fi


EOT
source $HOME/.zshrc
elif [ -f $HOME/.bash_profile ]; then
cat >> $HOME/.bash_profile << EOT

# location of bash aliases
if [ -f $HOME/.aliases/.bash_aliases ]; then
source $HOME/.aliases/.bash_aliases
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
echo 'please re-install bash aliases from https://github.com/newtonkiragu/.aliases'
fi


EOT
source $HOME/.bash_profile
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
echo 'no terminal emulator has been found! Please contact the developers for more details'
fi
}

# Execute the function
addbashaliases
