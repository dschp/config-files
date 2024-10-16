typeset -U PATH path
path=(~/.bin ~/go/bin ~/zig ~/.cabal/bin ~/.ghcup/bin ~/.cargo/bin "$path[@]")
export PATH

export TERM=xterm-256color
export EDITOR=vi

export KEYTIMEOUT=1

