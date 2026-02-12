HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000

export EDITOR=nvim

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-autosuggestions

zinit light zdharma-continuum/fast-syntax-highlighting

source /usr/share/doc/pkgfile/command-not-found.zsh
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

setopt autocd
bindkey -e
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit

