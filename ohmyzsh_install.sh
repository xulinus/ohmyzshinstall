#!/bin/bash

# Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo "curl is required but not installed. Please install curl and try again."
    exit 1
fi

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "Git is required but not installed. Please install Git and try again."
    exit 1
fi

# Check if Zsh is installed
if ! command -v zsh &> /dev/null; then
    echo "Zsh is required but not installed. Please install Zsh and try again."
    exit 1
fi

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Clone Powerlevel10k theme
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Clone zsh-syntax-highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Clone zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Modify ZSH_THEME in ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussell\/"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Modify plugins in ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc

# Continue with the rest of your script here
echo "Oh My Zsh, Powerlevel10k theme, zsh-syntax-highlighting, and zsh-autosuggestions plugins have been installed."
echo "The ZSH_THEME and plugins in ~/.zshrc have been modified."
echo "Please run the following commands:"
echo "1. zsh"
echo "2. p10k configure"
echo "This will start Zsh and configure Powerlevel10k."
