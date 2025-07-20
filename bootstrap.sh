#!/usr/bin/env sh

set -e

##===================##
# NIX PACKAGE MANAGER #
##===================##
echo "Installing Nix package manager..."
curl -L https://nixos.org/nix/install | bash

##===============##
# NIX ENVIRONMENT #
##===============##
. "$HOME/.nix-profile/etc/profile.d/nix.sh"

##============##
# HOME-MANAGER #
##============##
echo "Installing Home Manager..."
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
nix-channel --update

##========##
# HOME.NIX #
##========##
nix-shell '<home-manager>' -A install

echo "Applying Home Manager configuration..."
home-manager switch -f ~/dotfiles/home.nix

echo "Bootstrap complete!"
