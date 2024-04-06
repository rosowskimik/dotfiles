export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_OPT_HOME="${XDG_OPT_HOME:-$HOME/.local/opt}"

# Dotfiles
export DOTFILES="${XDG_DATA_HOME:-${HOME}/.local/share}/dotfiles"

# Cmake stuff
export CMAKE_EXPORT_COMPILE_COMMANDS="Yes"
export CMAKE_GENERATOR="Ninja"

# Node stuff
export FNM_DIR="$XDG_DATA_HOME/fnm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# Rust stuff
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# Python stuff
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export WORKON_HOME="$XDG_DATA_HOME/virtualenv"
export CONDA_ROOT="$XDG_CONFIG_HOME/conda"

# Go stuff
export GOPATH="$XDG_DATA_HOME/go"

# Zig stuff
export ZIG_HOME="$XDG_OPT_HOME/compilers/zig"

# Zephyr stuff
export ZEPHYR_WORKSPACE="$XDG_OPT_HOME/zephyrproject"
export ZEPHYR_WEST="$ZEPHYR_WORKSPACE/west"
export ZEPHYR_BASE="$ZEPHYR_WORKSPACE/zephyr"
export ZEPHYR_SDK_INSTALL_DIR="$ZEPHYR_WORKSPACE/sdks"

# Cross Compilers
export CROSS_BASE="$XDG_OPT_HOME/compilers/cross"

# PATH setup
prepend_path() {
  [ -d "$1" ] && export PATH="$1:$PATH"
}
append_path() {
  [ -d "$1" ] && export PATH="$PATH:$1"
}

prepend_path "$HOME/.bin"
prepend_path "$HOME/.local/bin"

prepend_path "$CARGO_HOME/bin"
prepend_path "$GOPATH/bin"
prepend_path "$ZIG_HOME"

# Defaults
export EDITOR="nvim"

# Cleanup
export HISTFILE="$XDG_DATA_HOME/zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export LESSHISTFILE=-
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
