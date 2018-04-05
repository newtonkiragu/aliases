# git aliases
alias st='git status'
alias gi='git init'
alias gc='git commit'
alias gcm='git commit -m'
alias grm='git remote'
alias gb='git branch'
alias gchb='git checkout -b'
alias gch='git checkout'
alias gp='git push'
alias gpl='git pull'
alias ga='git add'
alias grma='git remote add'

# system aliases
mcd() {
  mkdir $1
  cd $1
}
alias t="touch"
alias uu='sudo apt-get update && sudo apt-get upgrade'
alias dp='cd ~/Desktop'
alias dc='cd ~/Documents'
alias opn='xdg-open'
alias rlt='source ~/.bashrc ~/.bash_aliases'
alias ..='cd ../'
alias dl='cd ~/Videos && youtube-dl'
alias dla='cd ~/Videos && youtube-dl -cit'
alias install='sudo dpkg -i'
