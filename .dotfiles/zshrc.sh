# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle fzf
antigen bundle thefuck
# antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme robbyrussell
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# added by travis gem
[ -f /home/geektimus/.travis/travis.sh ] && source /home/geektimus/.travis/travis.sh

# Added to kubectl completion
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

# Added for bloop server
autoload -U compinit
fpath=($HOME/.bloop/zsh $fpath)
compinit

## Innecesary extended format.
# setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

# Set keybindings (fix kill line to begginning)
bindkey \^U backward-kill-line

# if [ -f ~/.ssh/agent.env  ] ; then
#     . ~/.ssh/agent.env > /dev/null
#     if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
#         echo "Stale agent file found. Spawning new agent… "
#         eval `ssh-agent | tee ~/.ssh/agent.env`
#         ssh-add
#     fi
# else
#     echo "Starting ssh-agent"
#     eval `ssh-agent | tee ~/.ssh/agent.env`
#     ssh-add
# fi

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent`
    ssh-add
fi

source $HOME/.dotfiles/zsh_aliases.sh
source $HOME/.dotfiles/zsh_functions.sh
source $HOME/.config/broot/launcher/bash/br

export GPG_TTY=$(tty)
