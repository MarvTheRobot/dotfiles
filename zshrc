if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

GPG_TTY=$(tty)
export GPG_TTY
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
plugins=(
  git
  fzf
  zsh-syntax-highlighting 
  zsh-autosuggestions 
  zsh-interactive-cd 
  azure
  vi-mode
)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste up-line-or-search down-line-or-search expand-or-complete accept-line push-line-or-edit)
export PATH="$PATH:/home/marv/go/bin"
export EDITOR=nvim
export DOCKER_DEFAULT_PLATFORM=linux/amd64

if type brew &>/dev/null; then
  export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

  source /opt/homebrew/share/zsh/site-functions/_docker
  complete -C /opt/homebrew/bin/terraform terraform
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
