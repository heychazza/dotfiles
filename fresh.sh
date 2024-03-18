#!/bin/sh

echo "Setting up your Mac..."

# Remove 1Password from Applications as we will install it via Homebrew
rm -rf /Applications/1Password.app

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Add source to .dotfiles/.zshrc to load the .zshrc file if not already present
if ! grep -q ".dotfiles/.zshrc" $HOME/.zshrc; then
  echo "source $HOME/.dotfiles/.zshrc" >> $HOME/.zshrc
fi

# Launch OrbStack
./docker.sh

# Create project directories
mkdir $HOME/Documents/Development
mkdir $HOME/Documents/Development/Sites
mkdir $HOME/Documents/Development/Code

# Clone Github repositories
./clone.sh

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos

./fonts.sh

# Configure Dock
./dock.sh
