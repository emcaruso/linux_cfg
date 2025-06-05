# rm old config
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# new config
cp -r ./config/ ~/.config/nvim

# install neovim
curl -LO https://github.com/neovim/neovim/releases/v0.11.2/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# # install Python LSP Server
# pip install python-lsp-server
# pip install "python-lsp-server[all]"
# pip install -U setuptools
# sudo apt-get install python3-pylsp
