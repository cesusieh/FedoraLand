# This file is sourced from /etc/profile by multiple shells. Keep it
# POSIX-sh compatible and run the real setup under native zsh emulation.
if [ -n "${ZSH_VERSION:-}" ] && [ -z "${FEDORALAND_ZSH_LOADED:-}" ]; then
  export FEDORALAND_ZSH_LOADED=1

  if [ -r /usr/share/fedoraland/zshrc.zsh ]; then
    emulate zsh -c 'source /usr/share/fedoraland/zshrc.zsh'
  fi
fi
