# load zsh file
ZSHHOME="${HOME}/.zsh"
# ディレクトリであり(-d)、かつ(-a)、読み込み権限あり(-r)、かつ(-a)、実行権限あり(-x)の場合
if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
  for i in $ZSHHOME/*; do
    # ${i##*/} -> ##で最長一致部分を削除(例:/username/.zsh/a.zsh -> a.zsh)
    # ( -f $i -o -h $i ) -> ファイルである(-f)、もしくは(-o)、シンボリックリンクである(-h)場合
    # . -> カレントシェル上でシェルスクリプトを実行
    [[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i
  done
fi

#### PATH

# brew path
if [ $(uname -m) = 'x86_64' ]; then
  alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew"
else
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# vim
export EDITOR=vim

# golang
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"

export PATH="$PATH:~/.bin"
export PATH="$HOME/.nodebrew/current/bin:$PATH"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# aqua
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
export AQUA_GLOBAL_CONFIG="$(aqua root-dir)/aqua.yaml"

# flutterfire
export PATH="$HOME/.pub-cache/bin:$PATH"

#### ALIAS

alias ls='ls -FG'
alias la='ls -aFG'
alias ll='ls -lFG'
alias lla='ls -laFG'
alias relogin='exec $SHELL -l'

# git
alias clean_branch="git branch --merged|egrep -v '\*|develop|main|master'|xargs git branch -d"
alias reset_master='git reset --hard origin/master'

# rails
alias rs='bundle exec rails'

# docker
alias d='docker'
alias dc='docker-compose'
alias dcnt='docker container'
alias dcur='docker container ls -f status=running -l -q'
alias dexec='docker container exec -it $(dcur)'
alias dimg='docker image'
alias drun='docker container run --rm -d'
alias drunit='docker container run --rm -it'
alias dstop='docker container stop $(dcur)'
alias tmuxa='tmux new-session \; source-file ~/.tmux/new_session'

# k8s
alias k='kubectl'
alias kc='kubie ctx'

# git
alias g='git'
alias gc='git b | peco | xargs git sw'

# aws
alias pf="env | grep AWS"
alias awsp="source _awsp"

#### BINDKEY

bindkey -e

bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^J'  down-line-or-history
bindkey -M viins '^K'  up-line-or-history

bindkey '^R' history-incremental-search-backward

bindkey '^ ' autosuggest-accept

#### PLUGIN

# peco+ghq
function peco-src () {
local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
if [ -n "$selected_dir" ]; then
  BUFFER="cd ${selected_dir}"
  zle accept-line
fi
zle clear-screen
}
zle -N peco-src
bindkey '^v' peco-src

# llvm
export LLVM_DIR=/usr/local/Cellar/llvm/9.0.1/lib/cmake

# zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi


# starship
eval "$(starship init zsh)"

# ignore upper & lower case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# kubectl
source <(kubectl completion zsh)
compdef __start_kubectl k

# helm
source <(helm completion zsh)

# stern
source <(stern --completion=zsh)

# flux
. <(flux completion zsh)

#### ETC

# character code
export LANG=ja_JP.UTF-8

# save command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# share command history
setopt share_history

# run tmux at terminal startup
# if [ $SHLVL = 1 ]; then
#   tmux
# fi

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
