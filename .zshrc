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

# vim
export EDITOR=vim
export PATH="/Users/e175754/Library/Python/3.8/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# golang
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"

export PATH="$PATH:~/.bin"
export PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# brew path
if [ $(uname -m) = 'x86_64' ]; then
  alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew"
else
  PATH=/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/usr/local/bin:
fi

#### ALIAS

alias tex='sh tex.sh'
alias ide='sh ide.sh'
alias box='sh box.sh'
alias mk='sh mk.sh'
alias ls='ls -FG'
alias la='ls -aFG'
alias ll='ls -lFG'
alias lla='ls -laFG'
alias relogin='exec $SHELL -l'

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
alias kc='kubectx | peco | xargs kubectx'
alias kn='kubens | peco | xargs kubens'

# git
alias g='git'
alias gc='git b | peco | xargs git co'

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

# iterm2
# source "${HOME}/.iterm2_shell_integration.zsh"

# asdf
if [ $(uname -m) = 'x86_64' ]; then
  . /usr/local/opt/asdf/libexec/asdf.sh
else
  . /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

# llvm
export LLVM_DIR=/usr/local/Cellar/llvm/9.0.1/lib/cmake

# starship
eval "$(starship init zsh)"

#### COMPLETION

autoload -U compinit; compinit
# ignore upper & lower case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# kubectl
source <(kubectl completion zsh)
compdef __start_kubectl k

# helm
source <(helm completion zsh)

# stern
source <(stern --completion=zsh)

# zsh
fpath=(path/to/zsh-completions/src $fpath)

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

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
