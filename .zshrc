# 分割ファイルの読み込み
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

# vim path
export EDITOR=vim
export PATH="/Users/e175754/Library/Python/3.8/bin:$PATH"
# rbenv path settings
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
#golang setting
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
# 文字コードの設定
export LANG=ja_JP.UTF-8
# 補完機能を有効にする
autoload -U compinit; compinit
# 大文字小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# コマンドの履歴を保存するファイル
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
bindkey -e

alias tex='sh tex.sh'
alias ide='sh ide.sh'
alias box='sh box.sh'
alias mk='sh mk.sh'
alias ls='ls -FG'
alias la='ls -aFG'
alias ll='ls -lFG'
alias lla='ls -laFG'
alias relogin='exec $SHELL -l'
# brew path
alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew"
# Rails　関連
alias rs='bundle exec rails'
# docker 関連
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
# k8s alias
alias k='kubectl'
alias kc='kubectx | peco | xargs kubectx'
alias kn='kubens | peco | xargs kubens'
# git alias
alias g='git'
alias gc='git b | peco | xargs git co'
# aws
alias pf="env | grep AWS"
alias awsp="source _awsp"

export PATH="$PATH:~/.bin"
export PATH=$HOME/.nodebrew/current/bin:$PATH


# pure settings
#fpath+=$HOME/.zsh/pure
#autoload -U promptinit; promptinit
#prompt pure
eval "$(starship init zsh)"

# zsh completions
fpath=(path/to/zsh-completions/src $fpath)

export LLVM_DIR=/usr/local/Cellar/llvm/9.0.1/lib/cmake

bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^J'  down-line-or-history
bindkey -M viins '^K'  up-line-or-history

bindkey '^R' history-incremental-search-backward

# peco+ghq setting
function peco-src () {
local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
if [ -n "$selected_dir" ]; then
  BUFFER="cd ${selected_dir}"
  zle accept-line
fi
zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/e175754/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/e175754/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/e175754/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/e175754/google-cloud-sdk/completion.zsh.inc'; fi
source <(kubectl completion zsh)
source <(helm completion zsh)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# mikanos tmp
PATH=/usr/local/opt/llvm@9/bin:$PATH
PATH=/usr/local/opt/binutils/bin:$PATH
PATH=/usr/local/Cellar/dosfstools/4.2/sbin:$PATH

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

. /usr/local/opt/asdf/asdf.sh
