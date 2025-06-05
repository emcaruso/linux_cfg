SCRIPT_DIR=$(dirname "$(realpath "$0")")
cd "$SCRIPT_PATH"

# install TODO

# copy custom zsh configuration
cp ./.tmux.conf ~/.tmux.conf
# tmux source-file ~/.tmux.conf
