#!/usr/bin/env bash
set -euo pipefail

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 24

echo "==> Cleanup Neovim config and caches"
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

echo "==> Remove old Neovim installation"
sudo rm -rf /opt/nvim /opt/nvim-linux-x86_64
sudo rm -f /usr/local/bin/nvim
sudo rm -f /usr/bin/nvim

echo "==> Download and install Neovim"
curl -fLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
sudo ln -sfn /opt/nvim/bin/nvim /usr/local/bin/nvim
rm -f nvim-linux-x86_64.tar.gz

echo "==> Prepare ~/.local/bin"
mkdir -p ~/.local
if [ -e ~/.local/bin ] && [ ! -d ~/.local/bin ]; then
  echo "WARNING: ~/.local/bin exists but is not a directory. Moving it to ~/.local/bin.backup"
  mv ~/.local/bin ~/.local/bin.backup
fi
mkdir -p ~/.local/bin

echo "==> Download and install lazygit"
curl -fLO https://github.com/jesseduffield/lazygit/releases/download/v0.52.0/lazygit_0.52.0_Linux_x86_64.tar.gz
tar -xzf lazygit_0.52.0_Linux_x86_64.tar.gz
install -m 755 lazygit ~/.local/bin/lazygit
rm -f lazygit lazygit_0.52.0_Linux_x86_64.tar.gz

echo "==> Copy Neovim config without lazy-lock.json"
mkdir -p ~/.config/nvim
rsync -av \
  --exclude='lazy-lock.json' \
  --exclude='.git' \
  ./config/ ~/.config/nvim/

echo "==> Refresh shell command hash"
hash -r || true

echo "==> Diagnostics"
echo "which nvim: $(which nvim)"
echo "type -a nvim:"
type -a nvim || true
echo
echo "ls -l /usr/local/bin/nvim:"
ls -l /usr/local/bin/nvim || true
echo
echo "readlink -f /usr/local/bin/nvim:"
readlink -f /usr/local/bin/nvim || true
echo
echo "/usr/local/bin/nvim --version:"
/usr/local/bin/nvim --version | head -n 3
echo
echo "/opt/nvim/bin/nvim --version:"
/opt/nvim/bin/nvim --version | head -n 3
echo
echo "nvim --version:"
nvim --version | head -n 3

echo "==> Done"
echo "Now run: nvim"
