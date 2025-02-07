#!/bin/bash

# clone repo if it doesn't exist
if [ ! -d "$HOME/dotfiles" ]; then
    echo "cloning dotfiles..."
    git clone https://github.com/bjornarvikhagen/dotfiles.git "$HOME/dotfiles"
fi

# neofetch config
echo "installing neofetch config..."
mkdir -p ~/.config/neofetch
cp "$HOME/dotfiles/neofetch/config.json" ~/.config/neofetch/config.conf

# cursor settings
echo "installing cursor settings..."
mkdir -p ~/.config/Cursor/User
cp "$HOME/dotfiles/cursor/settings.json" ~/.config/Cursor/User/settings.json

echo "done! restart your apps to see changes"