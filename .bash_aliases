# git aliases
alias st='git status'
alias gi='git init'
alias gc='git commit'
alias gcm='git commit -m'
alias grm='git remote -v'
alias gb='git branch'
alias gchb='git checkout -b'
alias gch='git checkout'
alias gp='git push'
alias gpl='git pull'
alias ga='git add'
alias grma='git remote add'
alias grmc='git rm --cached'
alias gca='git commit --amend -CHEAD'
alias gm='git merge'
alias gcl='git clone'
alias gf='git fetch'
gcr() {
  hub create newtonkiragu/$1
}

# system aliases
mcd() {
  mkdir $1
  cd $1
}
addalias() {
echo '
   #    #       ###    #     #####  #######  #####
  # #   #        #    # #   #     # #       #     #
 #   #  #        #   #   #  #       #       #
#     # #        #  #     #  #####  #####    #####
####### #        #  #######       # #             #
#     # #        #  #     # #     # #       #     #
#     # ####### ### #     #  #####  #######  #####

'
read -p "Enter name of new alias: "  newalias
read -p "Enter command for new alias: " newaliascommand
# echo 'Is this right: alias $newalias = $newaliascommand?'
read -p "add new alias? (y/n): " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
echo '###################################'
echo 'please run addalias to create new alias'
else
cat >> ~/.aliases/.bash_aliases << EOT
alias $newalias='$newaliascommand'
EOT
echo '###################################'
echo 'New alias saved'
fi
}
alias t="touch"
alias uu='sudo apt-get update && sudo apt-get -y upgrade'
alias dp='cd ~/Desktop'
alias dc='cd ~/Documents'
alias opn='xdg-open'
alias rlt='source ~/.bashrc ~/.aliases/.bash_aliases'
alias ..='cd ../'
alias dl='cd ~/Videos && youtube-dl'
alias dla='cd ~/Videos && youtube-dl -cit'
alias extract='tar xzfj'
alias na='nano ~/aliases/.bash_aliases'
alias stve='source virtual/bin/activate'
alias dlw='cd ~/Documents && wget -r'
alias ngrok='~/./ngrok http'
alias ufl='umount /dev/sdb'
alias ffl='mkfs.vfat -n 'BarryAllen' -I /dev/sdb'
alias rn='sudo service network-manager restart'
alias u='sudo apt-get update'
alias ua='sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get install -f && sudo apt-get -y dist-upgrade && sudo apt-get -y autoclean && sudo apt-get -y autoremove'
alias pyt='python3.6'
alias c='code .'
alias cdl='cd ~/Downloads'
alias _='sudo'
alias la='ls -a'
alias start='x-terminal-emulator'
alias ss='python -m SimpleHTTPServer'
mkvenv () {
  /usr/bin/python3.6 -m virtualenv $1
  source $1/bin/activate
}
inst () {
  sudo dpkg -i $1
  rm -rf $1
  echo "done installing"
}
alias v='vim'
alias d='deactivate'
alias cap='sudo create_ap wlo1 wlo1 Lenovo parseword'
alias gca='git commit -am'
rmalias () {
echo '
   #    #       ###    #     #####  #######  #####
  # #   #        #    # #   #     # #       #     #
 #   #  #        #   #   #  #       #       #
#     # #        #  #     #  #####  #####    #####
####### #        #  #######       # #             #
#     # #        #  #     # #     # #       #     #
#     # ####### ### #     #  #####  #######  #####

'
cd ~/
rm -rf .aliases/
if [ -f $HOME/.bashrc ]; then
  sed '/# location of bash aliases/,16 d' ~/.bashrc
elif [ -f $HOME/.zshrc ]; then
  sed '/# location of bash aliases/,16 d' ~/.zshrc
elif [ -f $HOME/.bash_profile ]; then
  sed '/# location of bash aliases/,16 d' ~/.bash_profile
fi
echo "Aliases app has been removed, it is done."
}
