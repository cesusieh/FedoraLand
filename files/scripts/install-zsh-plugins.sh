#!/usr/bin/env bash
set -euo pipefail

install -d /usr/share/zsh-autosuggestions /usr/share/zsh-syntax-highlighting
curl -fsSL -o /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
  https://raw.githubusercontent.com/zsh-users/zsh-autosuggestions/master/zsh-autosuggestions.zsh
curl -fsSL -o /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  https://raw.githubusercontent.com/zsh-users/zsh-syntax-highlighting/master/zsh-syntax-highlighting.zsh
