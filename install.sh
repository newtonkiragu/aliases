#!/bin/bash

set -e

# Default settings
ALIASES=${ALIASES:-~/.aliases}
REPO=${REPO:-newtonkiragu/aliases}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}
TERMINAL_EMULATOR=${TERMINAL_EMULATOR:-""}

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

error() {
	echo ${RED}"Error: $@"${RESET} >&2
}

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

setup_aliases() {
	# Prevent the cloned repository from having insecure permissions. Failing to do
	# so causes compinit() calls to fail with "command not found: compdef" errors
	# for users with insecure umasks (e.g., "002", allowing group writability). Note
	# that this will be ignored under Cygwin by default, as Windows ACLs take
	# precedence over umasks except for filesystems mounted with option "noacl".
	umask g-w,o-w

	echo "${BLUE}Cloning Aliases...${RESET}"

	command_exists git || {
		error "git is not installed"
		exit 1
	}

	if [ "$OSTYPE" = cygwin ] && git --version | grep -q msysgit; then
		error "Windows/MSYS Git is not supported on Cygwin"
		error "Make sure the Cygwin git package is installed and is first on the \$PATH"
		exit 1
	fi

	git clone -c core.eol=lf -c core.autocrlf=false \
		-c fsck.zeroPaddedFilemode=ignore \
		-c fetch.fsck.zeroPaddedFilemode=ignore \
		-c receive.fsck.zeroPaddedFilemode=ignore \
		--depth=1 --branch "$BRANCH" "$REMOTE" "$ALIASES" || {
		error "git clone of aliases repo failed"
		exit 1
	}

	echo
		echo "${YELLOW}Done...${RESET}"

}

function addbashaliases() {
  	echo "${BLUE}Setting up aliases...${RESET}"
if [ -f $HOME/.bashrc ]; then
  TERMINAL_EMULATOR=${TERMINAL_EMULATOR:-$HOME/.bashrc}
cat >> $HOME/.bashrc << EOT

# tools
for plugin ($tools); do
  if is_plugin TERMINAL_EMULATOR $plugin; then
    fpath=($ALIASES/tools/$plugin $fpath)
    echo "[aliases] plugin '$plugin' not found"
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
tools=(
  alias-finder
  git
  config
)

EOT
	echo "${YELLOW}Done...${RESET}"
elif [ -f $HOME/.zshrc ]; then
    TERMINAL_EMULATOR=${TERMINAL_EMULATOR:-$HOME/.zshrc}
cat >> $HOME/.zshrc << EOT

# tools
for plugin ($tools); do
  if is_plugin TERMINAL_EMULATOR $plugin; then
    fpath=($ALIASES/tools/$plugin $fpath)
    echo "[aliases] plugin '$plugin' not found"
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
echo 'please re-install bash aliases from https://github.com/newtonkiragu/.aliases'
fi

tools=(
  alias-finder
  git
  config
)

EOT
	echo "${YELLOW}Done...${RESET}"
elif [ -f $HOME/.bash_profile ]; then
      TERMINAL_EMULATOR=${TERMINAL_EMULATOR:-$HOME/.bash_profile}
cat >> $HOME/.bash_profile << EOT

# tools
for plugin ($tools); do
  if is_plugin TERMINAL_EMULATOR $plugin; then
    fpath=($ALIASES/tools/$plugin $fpath)
    echo "[aliases] plugin '$plugin' not found"
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
echo 'please re-install bash aliases from https://github.com/newtonkiragu/.aliases'
fi


tools=(
  alias-finder
  git
  config
)

EOT
	echo "${YELLOW}Done...${RESET}"
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

function reload() {
  	echo "${BLUE}Final Touches...${RESET}"

if [ -f $HOME/.bashrc ]; then
source $HOME/.bashrc
	echo "${YELLOW}Done...${RESET}"
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
 	echo "${YELLOW}Done...${RESET}"
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
	echo "${YELLOW}Done...${RESET}"
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

main() {
	setup_color

	if [ -d "$ALIASES" ]; then
		cat <<-EOF
			${YELLOW}You already have Aliases installed.${RESET}
			You'll need to remove '$ALIASES' if you want to reinstall.
		EOF
		exit 1
	fi

	setup_aliases
	addbashaliases
	reload

	printf "$GREEN"
	echo 'Please run alias to view pre-set aliases.'
	printf "$RESET"

}

main "$@"
