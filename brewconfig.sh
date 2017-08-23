#!/bin/sh

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "INSTALLING HOMEBREW..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install Brew Packages
# ---------------------

packages=(
  nvm
  ffmpeg
  hub
  git-flow
)

echo "INSTALLING BINARIES..."
brew install ${packages[@]}

# Cleanup after yourself
brew cleanup


# Install Applications
# --------------------
#
# Install Caskroom
brew install caskroom/cask/brew-cask

# Get newer versions of things
brew tap caskroom/versions

# Apps
apps=(
  google-chrome
  firefox
  atom
  sublime-text3
  mamp
  sequel-pro
  transmit
  slack
  dropbox
  appcleaner
  transmission
  adobe-creative-cloud
  sip
  google-backup-and-sync
  cloudapp
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "INSTALLING APPLICATIONS..."
brew cask install --appdir="/Applications" ${apps[@]}


# Install Fonts
# -------------
brew tap caskroom/fonts

# Font List
# Search caskroom using `brew cask search /font-roboto/`
fonts=(
  font-inconsolata
  font-droid-sans-mono
  font-dejavu-sans
  font-montserrat
  font-merriweather
  font-fira-mono
  font-fontawesome
)

# install fonts
echo "INSTALLING FONTS..."
brew cask install ${fonts[@]}


# Bash Profile
# ------------
#
# Copy Bash Profile
echo "SETTING UP BASH PROFILE..."
cp -i .bash_profile ~/.bash_profile

# Setup for NVM alias
[[ -d ~/.nvm ]] || mkdir ~/.nvm

# Setup for Sublime alias
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime

# Reload .bash_profile
source ~/.bash_profile


# Node.js and NPM
# ---------------
#
# Install Node v5.0, set it to default
echo "INSTALLING NODE.JS..."
nvm install v6.11.1 && nvm alias default v6.11.1

# Install Gulp and Bower
echo "INSTALLING GLOBAL NPM MODULES..."
npm install -g gulp
npm install -g browser-sync
npm install -g grunt-cli
npm install -g npm-check-updates


# Composer
# --------
echo "INSTALLING COMPOSER..."
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# WP CLI
# ------
echo "INSTALLING WORDPRESS CLI..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


# XCode CLI Tools
# ---------------
echo "CHECKING XCODE CLI TOOLS..."
# Only run if the tools are not installed yet
# To check that try to print the SDK path
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  echo "INSTALLING XCODE CLI TOOLS..."
  xcode-select --install
else
  echo "XCODE CLI TOOLS OK"
fi



