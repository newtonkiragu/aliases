#!/bin/bash

function addbashaliases() {
  # Add source bash_aliases on .bashrc
  cat >> ~/.bashrc << EOT
if [ -f ~/aliases/.bash_aliases ]; then
  . ~/aliases/.bash_aliases
fi
# addalias() {
#   cat >> ~/aliases/.bash_aliases << EOT
#   $1
#   EOT
}
EOT

  # Reload current environment
  source ~/.bashrc
}

# Execute the function
addbashaliases
