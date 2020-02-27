#!/usr/bin/env sh

# Aliasses

alias git='hub'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias pacman-cleanup='(pacman -Qtdq) && sudo  pacman -Rns $(pacman -Qtdq)'
# alias show-manifest='grep -r "branch: " | egrep -v "(develop|master)" | perl -nle '"''"'while(m/(.*)\/.*branch: (.*)/g){print "Repo: $1,\tBranch: $2"}'"''"''
alias show-manifest="grep -r "branch: " | egrep -v \"(develop|master)\" | perl -nle 'while(m/(.*)\/.*branch: (.*)/g){printf(\"Repo: %-30s\tBranch: %-30s\n\", $1, $2);}'"

alias ls='exa'
alias ll='exa -l'
alias lll='exa -l | less'
alias lla='exa -la'
alias llt='exa -T'
alias llfu='exa -bghHliS --git'
