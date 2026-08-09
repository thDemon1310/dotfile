# Steps and config for installing neoVim into pc!!!
## This steps will install nevvim in v 0.12.2 and I am using Ubunut 26lts
## update the system
```bash
$ sudo apt update
$ sudo apt upgrade
$ sudo apt-get install ninja-build gettext cmake curl build-essential git
```
## installing zsh and oh-my-zsh and ghostty
```bash
# install zsh and changeing shell to zsh
$ sudo apt install zsh
$ chsh -s $(which zsh)
# install ghostty 
$ sudo add-apt-repository ppa:mkasberg/ghostty-ubuntu
$ sudo apt update
$ sudo apt install ghostty
# install oh-my-zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# make ghoosty defalut
$ sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/ghostty 50
$ sudo update-alternatives --config x-terminal-emulator
```
- (Type the number next to Ghostty and press Enter).
### config for oh-my-zsh
```bash
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
$ vim ~/.zshrc
```
- paste the following
```vim
ZSH_THEME="bira"
plugins=(git zsh-syntax-highlighting)
```
## Installing neovim
```bash
$ git clone https://github.com/neovim/neovim
$ cd neovim
$ git checkout stable || git checout v0.12.3
$ make CMAKE_BUILD_TYPE=RelWithDebInfo
$ cd build && cpack -G DEB && sudo dpkg -i nvim-linux-x86_64.deb
```
## Neovim PLugion Dependency
### Image
```bash
$ sudo apt install imagemagick
```

### Plugin runtime deps
```bash
# telescope-fzf-native.nvim — needs make + a C compiler to build the .so
$ cd ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim
$ make

# LuaSnip — optional jsregexp support for snippet transformations
$ cd ~/.local/share/nvim/site/pack/core/opt/LuaSnip
$ make install_jsregexp

# blink.cmp — fetches a prebuilt Rust binary on first load, no cargo needed normally.
# Only install rust/cargo as a fallback if the prebuilt fetch fails:
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
$ source ~/.cargo/env

# lazygit.nvim — Lua wrapper only, needs the actual lazygit binary
$ sudo add-apt-repository ppa:lazygit-team/release
$ sudo apt update
$ sudo apt install lazygit

# mason.nvim — needs unzip and wget to download LSP servers
$ sudo apt install unzip wget

# telescope.nvim companions
$ sudo apt install ripgrep fd-find
```
- adjust the `pack/core/opt/<plugin>` paths above to match wherever your `vim.pack` config actually places plugins.

## Installing Node (via nvm)
```bash
# install nvm
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
$ source ~/.zshrc
# install latest LTS node
$ nvm install --lts
$ nvm use --lts
$ nvm alias default lts/*
# sanity check
$ node -v
$ npm -v
```

## Installing Docker
```bash
# remove old versions
$ for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
# add Docker's official GPG key
$ sudo apt-get update
$ sudo apt-get install ca-certificates curl
$ sudo install -m 0755 -d /etc/apt/keyrings
$ sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
$ sudo chmod a+r /etc/apt/keyrings/docker.asc
# add the repository
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# run docker without sudo
$ sudo usermod -aG docker $USER
$ newgrp docker
# sanity check
$ docker run hello-world
```

## Installing Bun
```bash
$ curl -fsSL https://bun.sh/install | bash
$ source ~/.zshrc
$ bun -v
```

## Installing tmux + TPM (tmux plugin manager)
```bash
$ sudo apt install tmux
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
- add to `~/.tmux.conf`:
```bash
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

run '~/.tmux/plugins/tpm/tpm'
```
- reload config and install plugins:
```bash
$ tmux source ~/.tmux.conf
# inside tmux, press: prefix + I  (capital i) to install plugins
```

## Dotfiles setup (GNU Stow) — starting from scratch
```bash
$ sudo apt install stow
$ mkdir ~/dotfiles && cd ~/dotfiles
$ git init
```
- each top-level folder = one "package", and its internal path mirrors `$HOME`.
  stow symlinks `~/dotfiles/<pkg>/x` to `~/x`, so the folder structure inside each
  package must match where the file actually lives relative to `$HOME`.
```bash
# create package folders matching your actual config locations
$ mkdir -p nvim/.config/nvim
$ mkdir -p tmux
$ mkdir -p zsh
$ mkdir -p ghostty/.config/ghostty

# move your existing configs IN (not copy — stow will symlink them back out)
$ mv ~/.config/nvim/* nvim/.config/nvim/
$ mv ~/.tmux.conf tmux/.tmux.conf
$ mv ~/.zshrc zsh/.zshrc
$ mv ~/.config/ghostty/* ghostty/.config/ghostty/

# stow everything — this creates the symlinks back into $HOME
$ stow nvim tmux zsh ghostty
```
- verify the symlinks landed correctly:
```bash
$ ls -la ~/.zshrc ~/.tmux.conf ~/.config/nvim ~/.config/ghostty
# each should show -> ~/dotfiles/<pkg>/... 
```
- commit and push:
```bash
$ git add .
$ git commit -m "initial dotfiles"
$ git remote add origin <your-empty-github-repo-url>
$ git push -u origin main
```

### On a new/second machine, once the repo exists
```bash
$ sudo apt install stow
$ git clone <your-dotfiles-repo-url> ~/dotfiles
$ cd ~/dotfiles
$ stow nvim tmux zsh ghostty
```
- if stow reports conflicts with existing files:
```bash
$ rm ~/.zshrc ~/.tmux.conf   # or whatever conflicts, back up first if needed
$ stow nvim tmux zsh ghostty
```
- to remove/unlink a package: `stow -D nvim`
- to re-link after editing package structure: `stow -R nvim`

## Verify everything
```bash
$ nvim --version
$ node -v && npm -v
$ docker --version
$ bun -v
$ tmux -V
$ zsh --version
$ ghostty --version
```
