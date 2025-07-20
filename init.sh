#!/usr/bin/env sh

set -e

##============##
# INSTALL YADM #
##============##
echo "Installing yadm..."
if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y yadm
elif command -v brew &> /dev/null; then
    brew install yadm
else
    echo "Please install 'yadm' manually."
    exit 1
fi

##=====================##
# CLONE YADM REPOSITORY #
##=====================##
echo "Cloning dotfiles repository using yadm..."
yadm clone https://github.com/CovertDuck/dotfiles.git

##==============##
# YADM BOOTSTRAP #
##==============##
echo "Running bootstrap script..."
cd "$HOME/.config/yadm/repo.git" && ./bootstrap.sh

echo "Setup complete!"
