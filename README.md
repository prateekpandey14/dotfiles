# Dotfiles

## Neovim Setup:

### To install Neovim on Ubuntu 16.04

```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo pip3 install --upgrade neovim  (for python3 support)
```

### Install vim-plug plugin manager:

```bash
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
