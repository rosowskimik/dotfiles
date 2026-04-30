alias bat="batcat"
alias cat="batcat --style=plain"
alias fd="fdfind"
alias grep="command grep --color=auto"
alias ip="command ip --color=auto"
alias ls="eza --color=auto --group-directories-first -F"
alias l="ls --smart-group -lgahM"
alias lzg="lazygit"

export TERM=kitty

sudo systemd-run --scope --no-block --quiet -- apt update -qqy
