autoload -Uz compinit

if [ -n "${XDG_CACHE_HOME:-}" ]; then
  zsh_cache_dir="${XDG_CACHE_HOME}/zsh"
else
  zsh_cache_dir="${HOME}/.cache/zsh"
fi

mkdir -p "${zsh_cache_dir}"
compinit -d "${zsh_cache_dir}/zcompdump"
unset zsh_cache_dir

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if [ -r /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

sudo-command-line() {
  if [[ -z "${BUFFER}" ]]; then
    zle up-history
  fi

  if [[ "${BUFFER}" == sudo\ * ]]; then
    BUFFER="${BUFFER#sudo }"
  else
    BUFFER="sudo ${BUFFER}"
  fi

  CURSOR="${#BUFFER}"
}

zle -N sudo-command-line
bindkey $'\e\e' sudo-command-line

extract() {
  if [ "$#" -eq 0 ]; then
    echo "usage: extract <archive> [...]" >&2
    return 2
  fi

  local archive
  for archive in "$@"; do
    if [ ! -f "${archive}" ]; then
      echo "extract: not a file: ${archive}" >&2
      continue
    fi

    case "${archive}" in
      *.tar.bz2|*.tbz2) tar xjf "${archive}" ;;
      *.tar.gz|*.tgz) tar xzf "${archive}" ;;
      *.tar.xz|*.txz) tar xJf "${archive}" ;;
      *.tar.zst|*.tzst) tar --zstd -xf "${archive}" ;;
      *.tar) tar xf "${archive}" ;;
      *.bz2) bunzip2 "${archive}" ;;
      *.gz) gunzip "${archive}" ;;
      *.xz) unxz "${archive}" ;;
      *.zip) unzip "${archive}" ;;
      *.7z) 7z x "${archive}" ;;
      *) echo "extract: unsupported archive: ${archive}" >&2 ;;
    esac
  done
}

if [ -r /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
