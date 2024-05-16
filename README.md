# Setup Vim

## Plugin Manager

https://github.com/junegunn/vim-plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Press :PlugInstall

# Setup Tmux

## Plugin Manager

https://github.com/tmux-plugins/tpm

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
```

Press prefix + I

# Setup Alacritty

## Color Scheme

https://github.com/alacritty/alacritty-theme

```
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

# Create symlink

```
ln -s $HOME/go/src/github.com/ksudate/dotfiles/alacritty.toml $HOME/.alacritty.toml
ln -s $HOME/go/src/github.com/ksudate/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/go/src/github.com/ksudate/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/go/src/github.com/ksudate/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/go/src/github.com/ksudate/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/go/src/github.com/ksudate/dotfiles/aqua.yaml $(aqua root-dir)/aqua.yaml
ln -s $HOME/go/src/github.com/ksudate/dotfiles/ignore $HOME/ignore
ln -s $HOME/go/src/github.com/ksudate/dotfiles/kubie.yaml $HOME/.kube/kubie.yaml
ln -s $HOME/go/src/github.com/ksudate/dotfiles/starship.toml $HOME/.config/starship.toml
```

# Install SF Mono Square

```
 open "$(brew --prefix sfmono-square)/share/fonts"
```

1. Open SFMonoSquare-Regular.otf
2. Install in Font Book
