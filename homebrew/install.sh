#!/bin/bash

#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

brew install --cask alacritty
brew install --cask deepl
brew install --cask docker
brew install --cask google-chrome
brew install --cask gather
brew install --cask notion
brew install --cask raycast
brew install --cask slack
brew install --cask visual-studio-code
brew install --cask zoomus
brew install --cask 1password-cli
brew install --cask 1password

brew install argocd
brew install aquaproj/aqua/aqua
brew install coreutils
brew install cue
brew install fzf
brew install ghq
brew install gh
brew install git
brew install gnupg
brew install grpcurl
brew install jq
brew install kyverno
brew install mysql
brew install orbstack
brew install peco
brew install protobuf
brew install pwgen
brew install redis
brew install rbenv
brew install starship
brew install tektoncd-cli
brew install tig
brew install tmux
brew install tree
brew install vim
brew install watch
brew install wget
brew install yarn
brew install python-yq
brew install zsh
brew install zsh-autosuggestions
brew install zsh-completions

# terraform related
brew install tfenv

# cloudformation related
brew install cfn-lint

# k8s related
brew install aquasecurity/trivy/trivy
brew install conftest
brew install helm
brew install kind
brew install kubeconform
brew install kubie
brew install k9s
brew install stern

# nvim related
brew install luarocks
brew install rg
brew install fd
brew install lazygit

# linter
brew install shellcheck
brew install shfmt
brew install yamllint

# font
brew tap sanemat/font
brew install ricty --with-powerline
brew install font-hackgen-nerd

brew tap delphinus/sfmono-square
brew install sfmono-square

# open fonts with Finder
# open "$(brew --prefix sfmono-square)/share/fonts"

# lang
brew install nodebrew
nodebrew setup
nodebrew install latest
# nodebrew use v10.20.1
brew install go
