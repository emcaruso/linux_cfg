$SCRIPT_PATH = $(dirname "$0")
cd $SCRIPT_PATH

wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
cd zsh

./configure --prefix=$HOME
make install
make

# execute zsh in bashrc
echo "exec zsh" >>~/.bashrc

# cp config
cp .zshrc ~/.zshrc
