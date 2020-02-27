#!/usr/bin/env sh

# Install base packages
sudo pacman -S --noconfirm xclip zsh git git-crypt git-lfs screen fzf thefuck tmux python-setuptools tk hub exa broot

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
if [ -d "$HOME/.emacs.d" ]; then
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
