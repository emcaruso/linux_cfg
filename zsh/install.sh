SCRIPT_DIR=$(dirname "$(realpath "$0")")
cd "$SCRIPT_PATH"

# remove old installation
rm -rf ~/.oh-my-zsh

# install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy custom zsh configuration
cp ./.zshrc ~/.zshrc
