alias cat='bat'
alias disk='ncdu'
alias htop='btop'
alias httpie='http'
alias ls='eza --icons=auto --group-directories-first'
alias tree='eza --tree --level=2 --icons=auto'
alias md='glow'
alias podmantui='podman-tui'

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
