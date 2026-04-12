#!/usr/bin/env bash
set -e

# cleanup nvim
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
sudo rm -rf /opt/nvim /opt/nvim-linux-x86_64
sudo rm -f /usr/local/bin/nvim

# install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim
rm -f nvim-linux-x86_64.tar.gz

# install lazygit
mkdir -p ~/.local/bin
curl -LO https://github.com/jesseduffield/lazygit/releases/download/v0.52.0/lazygit_0.52.0_Linux_x86_64.tar.gz
tar -xzf lazygit_0.52.0_Linux_x86_64.tar.gz
mv -f lazygit ~/.local/bin/
rm -f lazygit_0.52.0_Linux_x86_64.tar.gz

# copy config, but NOT the lockfile
mkdir -p ~/.config/nvim
rsync -av \
  --exclude='lazy-lock.json' \
  --exclude='.git' \
  ./config/ ~/.config/nvim/

hash -r || true

echo "nvim -> $(which nvim)"
nvim --version | head -n 1
