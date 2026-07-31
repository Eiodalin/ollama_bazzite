#!/usr/bin/env bash
set -euo pipefail

# Install Homebrew (Linuxbrew) if it's not already present
if ! command -v brew &>/dev/null; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Load brew into this shell session
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Persist brew on the PATH for future shells
if ! grep -q 'linuxbrew/bin/brew shellenv' ~/.bashrc 2>/dev/null; then
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
fi

brew install podman-compose