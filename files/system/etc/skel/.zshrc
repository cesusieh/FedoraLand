if [ -z "${FEDORALAND_ZSH_LOADED:-}" ]; then
  if [ -r /etc/profile.d/fedoraland-zsh.sh ]; then
    source /etc/profile.d/fedoraland-zsh.sh
  elif [ -r /run/host/etc/profile.d/fedoraland-zsh.sh ]; then
    source /run/host/etc/profile.d/fedoraland-zsh.sh
  fi
fi
