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
  git create newtonkiragu/$1
}

# system aliases
mcd() {
  mkdir $1
  cd $1
}
addalias() {
read -p "Enter name of new alias: "  newalias
read -p "Enter command for new alias: " newaliascommand
read -p 'is this right: alias $newalias=$newaliascommand? ' newprompt
if [ newprompt == 'Yes' or 'Y' or 'y' ]; then
cat >> ~/aliases/.bash_aliases << EOT
alias $newalias='$newaliascommand'
EOT
else
echo 'please run addalias to create new alias'
}
alias t="touch"
alias uu='sudo apt-get update && sudo apt-get -y upgrade'
alias dp='cd ~/Desktop'
alias dc='cd ~/Documents'
alias opn='xdg-open'
alias rlt='source ~/.bashrc ~/aliases/.bash_aliases'
alias ..='cd ../'
alias dl='cd ~/Videos && youtube-dl'
alias dla='cd ~/Videos && youtube-dl -cit'
alias install='sudo dpkg -i'
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
alias c='code-insiders .'
alias bs='bucklespring.buckle'
