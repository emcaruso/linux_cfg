# install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# backup
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# config
cp -r ./config/ ~/.config/nvim

# # install Python LSP Server
# pip install python-lsp-server
# pip install "python-lsp-server[all]"
# pip install -U setuptools
# sudo apt-get install python3-pylsp
