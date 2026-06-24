#!/usr/bin/env bash
set -euo pipefail

authselect select local with-silent-lastlog with-mdns4 with-pam-gnome-keyring --force
