__utils_path="$(fdfind --absolute-path --follow --glob --min-depth 1 --max-depth 3 --type d -1 utils "${PWD}")"

function brmake() {
  if [[ $@ == *"config"* ]]; then
    make "${@}"
  else
    make "${@}" 2>&1 | tee br.log | grep --colour=never -F "$(tput smso)>>>"
  fi
}

function set-ccache() {
  if [ -n "$1" ]; then
    dir="$1"
  else
    dir="$PWD"
  fi
  printf 'export BR2_CCACHE_DIR="%s/ccache"\n' "$dir"
  export BR2_CCACHE_DIR="$dir/ccache"
}

function unset-ccache() {
  unset BR2_CCACHE_DIR
}
