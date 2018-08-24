#!/bin/sh

cd
git clone https://github.com/newtonkiragu/aliases/
cd aliases
chmod +x install.sh
./install.sh

function reload() {
if [ -f $HOME/.bashrc ]; then
source $HOME/.bashrc
elif [ -f $HOME/.zshrc ]; then
 source $HOME/aliases/.bash_aliases
elif [ -f $HOME/.bash_profile ]; then
source $HOME/aliases/.bash_aliases
else
  echo 'please reload your terminal fam.'
fi
}

# Execute the function
reload
cd