# Set default language
export LANG=en_US.UTF-8
export LC_ALL='en_US.UTF-8'

# Set default editor
export VISUAL="vim"
export EDITOR="vim"

# Reduce ESC delay in zsh vi-mode
export KEYTIMEOUT=1

# Make commands use colors if possible
export CLICOLOR=yes

# VIM manpager \m/
export MANPAGER='col -bx | vim -MR +MANPAGER -'
export BAT_THEME='ansi' # TODO: create a bat theme based on bluebox

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty)
