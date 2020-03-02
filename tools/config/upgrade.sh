
# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

cd ~/.aliases/ || printf "${RED}%s${NORMAL}\n" 'Aliases Could not be found!!!'

# Set git-config values known to fix git errors
# Line endings (#4069)
git config core.eol lf
git config core.autocrlf false
# zeroPaddedFilemode fsck errors (#4963)
git config fsck.zeroPaddedFilemode ignore
git config fetch.fsck.zeroPaddedFilemode ignore
git config receive.fsck.zeroPaddedFilemode ignore

# Update upstream remote to ohmyzsh org
remote=$(git remote -v | awk '/https:\/\/github\.com\/newtonkiragu\/aliases\.git/{ print $1; exit }')
if [ -n "$remote" ]; then
  git remote set-url "$remote" "https://github.com/newtonkiragu/aliases.git"
fi

printf "${BLUE}%s${NORMAL}\n" "Updating Aliases"
if git pull --rebase --stat origin master
then
  printf '%s' "$GREEN"
  echo '
     #    #       ###    #     #####  #######  #####
    # #   #        #    # #   #     # #       #     #
   #   #  #        #   #   #  #       #       #
  #     # #        #  #     #  #####  #####    #####
  ####### #        #  #######       # #             #
  #     # #        #  #     # #     # #       #     #
  #     # ####### ### #     #  #####  #######  #####

'
  printf "${BLUE}%s\n" "Hooray! Aliases has been updated and/or is at the current version."
  printf "${BLUE}${BOLD}%s${NORMAL}\n" "To keep up on the latest news and updates, follow me on github: https://github.com/newtonkiragu"
else
  printf "${RED}%s${NORMAL}\n" 'There was an error updating. Try again later?'
fi
