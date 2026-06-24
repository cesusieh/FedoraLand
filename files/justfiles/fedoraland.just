install component:
    #!/usr/bin/env bash
    set -euo pipefail

    case "{{ component }}" in
      homebrew)
        fedoraland-install-homebrew
        ;;
      *)
        echo "Unknown install target: {{ component }}" >&2
        echo "Available install targets:" >&2
        echo "  homebrew" >&2
        exit 2
        ;;
    esac

install-homebrew:
    fedoraland-install-homebrew

toolbox-shell container="":
    #!/usr/bin/env bash
    set -euo pipefail

    toolbox_args=()
    if [ -n "{{ container }}" ]; then
      toolbox_args+=(--container "{{ container }}")
    fi

    toolbox run "${toolbox_args[@]}" sh -lc '
      set -e

      if command -v dnf5 >/dev/null 2>&1; then
        sudo dnf5 -y install dnf5-plugins
        sudo dnf5 -y copr enable atim/starship
        sudo dnf5 -y install zsh starship zsh-autosuggestions zsh-syntax-highlighting bzip2 gzip tar unzip xz 7zip zstd
      else
        sudo dnf -y install dnf-plugins-core
        sudo dnf -y copr enable atim/starship
        sudo dnf -y install zsh starship zsh-autosuggestions zsh-syntax-highlighting bzip2 gzip tar unzip xz 7zip zstd
      fi
    '
