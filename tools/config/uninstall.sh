rmalias () {
read -r -p "Are you sure you want to remove Aliases? [y/N] " confirmation
if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
  echo "Uninstall cancelled"
  exit
fi

echo "Removing ~/.aliases"
if [ -d ~/.aliases/ ]; then
  rm -rf ~/.aliases/
fi

echo "Please go to your bash file (~/.bashrc or ~/.zshrc or ~/.bash_profile) and remove the aliases configuration settings. It looks like this:"
echo "
# tools
for plugin ($tools); do
  if is_plugin TERMINAL_EMULATOR $plugin; then
    fpath=($ALIASES/tools/$plugin $fpath)
    echo "[oh-my-zsh] plugin '$plugin' not found"
  fi
done

# location of bash aliases
if [ -f $HOME/.aliases/.bash_aliases ]; then
source $HOME/.aliases/.bash_aliases
source $HOME/.aliases/custom/.bash_aliases
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

# aliases tools
"

echo "Thanks for trying out Aliases. It's been uninstalled."
echo "Don't forget to restart your terminal!"
}