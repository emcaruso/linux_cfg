# rm old config
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
sudo rm -rf /opt/nvim

# new config
cp -r ./config/ ~/.config/nvim

# install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# install lazygit
curl -LO https://github.com/jesseduffield/lazygit/releases/download/v0.52.0/lazygit_0.52.0_Linux_x86_64.tar.gz
tar -xzf lazygit_0.52.0_Linux_x86_64.tar.gz
mv lazygit ~/.local/bin
