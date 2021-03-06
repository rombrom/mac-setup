autoload -U add-zsh-hook
autoload -Uz vcs_info

setopt PROMPT_SUBST

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr ' ⌥'
zstyle ':vcs_info:*' unstagedstr ' +'
zstyle ':vcs_info:*' formats '%F{12}%16<…<%b%<<%F{3}%c%u%f '
zstyle ':vcs_info:*' actionformats '%F{12}%b %F{11}%a%F{3}%c%u%f '

add-zsh-hook precmd vcs_info

function __gobble() {
  local str=${(D)1}
  local max=${2:-16}
  local sep=${3:-/}

  local length=$#str
  local parts=(${(ps:$sep:)${str}})

  for (( i = 1; i < $#parts; i++ )); do
    local part=$parts[$i]

    if [[ ${#${(pj:$sep:)parts}} > $max ]]; then
      if [[ $part =~ '^\.' ]]; then
        parts[$i]=$part[0,2]
      else
        parts[$i]=$part[0,1]
      fi
    fi
  done

  print ${(pj:$sep:)parts}
}

PS1='%B%F{4}$(__gobble $PWD)%f ${vcs_info_msg_0_}%F{8}%#%f%b '
RPS1='%F{8}%T%f'
