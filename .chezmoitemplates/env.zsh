# XDG Base
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_OPT_HOME="${XDG_OPT_HOME:-$HOME/.local/opt}"
export XDG_SRC_HOME="${XDG_SRC_HOME:-$HOME/.local/src}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Apptainer stuff
export APPTAINER_CACHEDIR="$XDG_CACHE_HOME/apptainer"
export APPTAINER_CONTAINERS="$XDG_SRC_HOME/apptainer"
export APPTAINER_BINDPATH="${WAYLAND_DISPLAY:+${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY},}$SSH_AUTH_SOCK"

# Cmake stuff
export CMAKE_EXPORT_COMPILE_COMMANDS="Yes"
export CMAKE_GENERATOR="Ninja"

export COMPILERS_BASE="$XDG_OPT_HOME/compilers"
export CROSS_BASE="$COMPILERS_BASE/cross"

# Go stuff
export GOPATH="$XDG_DATA_HOME/go"
{{- if eq .chezmoi.osRelease.id "debian" }}
export GOHOME="$COMPILERS_BASE/go"
{{- end }}

# Python stuff
export WORKON_HOME="$XDG_DATA_HOME/virtualenv"
export UV_LINK_MODE="clone"

# Rust stuff
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# Zig stuff
export ZIG_HOME="$COMPILERS_BASE/zig"

# Zephyr stuff
export ZEPHYR_WORKSPACE="$XDG_OPT_HOME/zephyrproject"
export ZEPHYR_WEST="$ZEPHYR_WORKSPACE/west"
export ZEPHYR_SDK_INSTALL_DIR="$ZEPHYR_WORKSPACE/sdks"

# Defaults
export EDITOR=nvim
{{- if eq .chezmoi.osRelease.id "debian" }}
export PAGER="batcat -p"
{{- else if eq .chezmoi.osRelease.id "gentoo" }}
export PAGER="less"
{{- else }}
export PAGER="bat -p"
{{- end }}

# Cleanup
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=20000
export SAVEHIST="$HISTSIZE"
export LESSHISTFILE=-
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# PATH helpers
prepend_path() {
  [ -d "$1" ] && PATH="$1:$PATH"
}
append_path() {
  [ -d "$1" ] && PATH="$PATH:$1"
}

append_path "$HOME/.bin"
append_path "$HOME/.local/bin"

{{- if eq .chezmoi.osRelease.id "debian" }}
append_path /usr/games
append_path "$GOHOME/bin"
{{- end }}

{{- if eq .chezmoi.osRelease.id "gentoo" }}
prepend_path "$CARGO_HOME/bin"
{{- else }}
append_path "$CARGO_HOME/bin"
{{- end }}

append_path "$GOPATH/bin"
append_path "$ZIG_HOME"

append_path /opt/renode_portable

export PATH
