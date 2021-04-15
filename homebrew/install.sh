#!/bin/bash

which brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
brew update

brew install --cask google-chrome
brew install --cask slack
brew install --cask iterm2
brew install --cask discord
brew install --cask docker
brew install --cask zoomus
brew install --cask notion
brew install --cask deepl

brew install git
brew install zsh
brew install zsh-completions
brew install vim
brew install tmux
brew install starship
brew install jq
brew install peco
brew install ghq
brew install tree
# k8s related
brew install k9s
brew install kubectx
# linter
brew install yamllint
brew install shellcheck
brew install shfmt
# font
brew tap sanemat/font
brew install ricty --with-powerline
# lang
brew install nodebrew
brew install go
