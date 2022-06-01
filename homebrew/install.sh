#!/bin/bash

which brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
brew update

brew install --cask alacritty
brew install --cask alfred
brew install --cask biscuit
brew install --cask clipy
brew install --cask deepl
brew install --cask discord
brew install --cask docker
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask lens
brew install --cask notion
brew install --cask slack
brew install --cask visual-studio-code
brew install --cask zoomus

brew install argocd
brew install coreutils
brew install fluxcd/tap/flux
brew install fzf
brew install ghq
brew install gh
brew install git
brew install jq
brew install peco
brew install pwgen
brew install redis
brew install rbenv
brew install starship
brew install tig
brew install tmux
brew install tree
brew install vim
brew install wget
brew install yarn
brew install zsh
brew install zsh-completions

# terraform related
brew install tfenv

# cloudformation related
brew install cfn-lint

# k8s related
brew install asdf
brew install aquasecurity/trivy/trivy
brew install conftest
brew install helm
brew install kind
brew install kubectx
brew install k9s
brew install stern

# linter
brew install shellcheck
brew install shfmt
brew install yamllint

# font
brew tap sanemat/font
brew install ricty --with-powerline

brew tap delphinus/sfmono-square
brew install sfmono-square

# open fonts with Finder
# open "$(brew --prefix sfmono-square)/share/fonts"

# lang
brew install nodebrew
brew install go
