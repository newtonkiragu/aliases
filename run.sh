#!/bin/bash

cd
git clone https://github.com/newtonkiragu/aliases/
cd aliases
chmod +x install.sh
./install.sh

function reload() {
if [ -f $HOME/.bashrc ]; then
source $HOME/.bashrc
elif [ -f $HOME/.zshrc ]; then
 source $HOME/.zshrc
elif [ -f $HOME/.bash_profile ]; then
source $HOME/.bash_profile
else
  echo 'please reload your terminal fam.'
fi
}

cd
# Execute the function
reload