#!/usr/bin/env bash

# Install Homebrew first
if ! type "brew" 2>/dev/null; then
  echo "Installing Homebrew..."
  echo ""
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install utilities via Homebrew
echo "Installing Homebrew packages..."
echo ""
source ./init/brew.sh

# Install essential Node utils
echo "Installing Node packages..."
echo ""
source ./init/node.sh

# Install essential Node utils
echo "Installing Python packages..."
echo ""
source ./init/python.sh

# Sync dotfiles
echo "Synchronizing dotfiles..."
echo ""
stow --dir=dotfiles --target="$HOME" \
  --stow ctags \
  --stow git \
  --stow kitty \
  --stow misc \
  --stow tig \
  --stow vim \
  --stow zsh \
  --verbose

echo "Installing vim plugins"
echo ""
vim +PlugInstall +qa

# Sync settings
echo "Copying settings..."
echo ""
cp -v ./settings/dnsmasq.conf /usr/local/etc/dnsmasq.conf

sudo mkdir -p /etc/resolver
sudo cp -v ./settings/localhost.resolver /etc/resolver/localhost

# Kick off dnsmasq
sudo brew services start dnsmasq

# change shell to newly installed zsh
echo "Changing shell to /usr/local/bin/zsh"
echo ""
sudo chsh -s "$(which zsh)" "$(whoami)"
