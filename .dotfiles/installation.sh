#!/usr/bin/env sh

# Install base packages
sudo pacman -S --noconfirm xclip zsh git git-crypt git-lfs screen fzf thefuck tmux python-setuptools tk hub exa broot jdk8-openjdk

# Install antigen

## Create the folder if it doesnt exist
if [ ! -d "$HOME/.antigen" ]; then
    mkdir $HOME/.antigen
fi

## Download the configuration file if it doesnt exist.
if [ ! -f "$HOME/.antigen/antigen.zsh" ]; then
    curl -L git.io/antigen > $HOME/.antigen/antigen.zsh
fi

# Install Doom Emacs
if [ ! -d "$HOME/.emacs.d/bin" ]; then
    rm -rf "$HOME/.emacs.d"
    git clone https://github.com/hlissner/doom-emacs $HOME/.emacs.d
    ~/.emacs.d/bin/doom install
fi

if [ ! -L "$HOME/.zshrc" ]; then
    ln -s $HOME/.dotfiles/zshrc.sh $HOME/.zshrc
fi

if [ ! -L "$HOME/.zshenv" ]; then
    ln -s $HOME/.dotfiles/zshenv.sh $HOME/.zshenv
fi

if [ ! -d "$HOME/.bin" ]; then
    mkdir $HOME/.bin
fi

if [ ! -f "$HOME/.bin/coursier" ]; then
    curl -L -o $HOME/.bin/coursier https://git.io/coursier-cli
    chmod +x $HOME/.bin/coursier
fi

if [ ! -f "$HOME/.bin/metal-emacs" ]; then
    coursier bootstrap --java-opt -Xss4m --java-opt -Xms100m \
        --java-opt -Dmetals.client=emacs org.scalameta:metals_2.12:0.8.1 \
        -r bintray:scalacenter/releases -r sonatype:snapshots \
        -o $HOME/.bin/metals-emacs -f
    chmod +x $HOME/.bin/metals-emacs
fi

if [[ ! $(echo $SHELL) == *"zsh" ]]; then
    chsh -s $(which zsh)
fi
