SCRIPT_DIR=$(dirname "$(realpath "$0")")
cd "$SCRIPT_PATH"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp ./.zshrc ~/.zshrc
# exec zsh in .bashrc, if not present
if ! grep -q "exec zsh" ~/.bashrc; then
  echo "exec zsh" >>~/.bashrc
fi
