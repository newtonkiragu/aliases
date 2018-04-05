#!/bin/bash

function addbashaliases() {
  # Add source bash_aliases on .bashrc
  cat >> ~/.bashrc << EOT
if [ -f ~/aliases/.bash_aliases ]; then
  . ~/aliases/.bash_aliases
fi
EOT

  # Reload current environment
  source ~/.bashrc
}

# Execute the function
addbashaliases
