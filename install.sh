#!/bin/bash

function addbashaliases() {
if [ -f $HOME/.bashrc ]; then
cat >> $HOME/.bashrc << EOT
  source $HOME/aliases/.bash_aliases
EOT
source $HOME/.bashrc
elif [ -f $HOME/.zshrc ]; then
cat >> $HOME/.zshrc << EOT
  source $HOME/aliases/.bash_aliases
EOT
  source $HOME/aliases/.bash_aliases
elif [ -f $HOME/.bash_profile ]; then
cat >> $HOME/.bash_profile << EOT
  source $HOME/aliases/.bash_aliases
EOT
  source $HOME/aliases/.bash_aliases
else
  echo 'no console has been found! Please contact the developers for more details'
fi
}

# Execute the function
addbashaliases
