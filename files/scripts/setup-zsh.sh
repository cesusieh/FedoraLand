#!/usr/bin/env bash

set -oue pipefail
sed -i 's|^SHELL=.*|SHELL=/bin/zsh|' /etc/default/useradd