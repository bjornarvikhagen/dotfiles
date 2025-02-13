#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' 

echo -e "${BLUE}
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣄⠀⠀⠀⣦⣤⣾⣿⠿⠛⣋⣥⣤⣀⠀⠀⠀⠀
⠀⠀⠀⠀⡤⡀⢈⢻⣬⣿⠟⢁⣤⣶⣿⣿⡿⠿⠿⠛⠛⢀⣄⠀
⠀⠀⢢⣘⣿⣿⣶⣿⣯⣤⣾⣿⣿⣿⠟⠁⠄⠀⣾⡇⣼⢻⣿⣾
⣰⠞⠛⢉⣩⣿⣿⣿⣿⣿⣿⣿⣿⠋⣼⣧⣤⣴⠟⣠⣿⢰⣿⣿
⣶⡾⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣈⣩⣤⡶⠟⢛⣩⣴⣿⣿⡟
⣠⣄⠈⠀⣰⡦⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡛⠛⠛⠁
⣉⠛⠛⠛⣁⡔⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠥⠀⠀
⣭⣏⣭⣭⣥⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠${NC}
"

if [ ! -d "$HOME/dotfiles" ]; then
    echo -e "${BLUE}📦 cloning dotfiles...${NC}"
    git clone https://github.com/bjornarvikhagen/dotfiles.git "$HOME/dotfiles"
fi

echo -e "${BLUE}installing neofetch config...${NC}"
mkdir -p ~/.config/neofetch
cp "$HOME/dotfiles/neofetch/config.json" ~/.config/neofetch/config.conf
echo -e "${BLUE}neofetch config installed${NC}"

echo -e "${GREEN}Which editor are you using?${NC}"
select editor in "Cursor" "VSCode" "Skip"; do
    case $editor in
        "Cursor")
            echo -e "${BLUE}installing cursor settings...${NC}"
            cp "$HOME/dotfiles/cursor/settings.json" "$HOME/Library/Application Support/Cursor/User/settings.json"
            break
            ;;
        "VSCode")
            echo -e "${BLUE}installing vscode settings...${NC}"
            cp "$HOME/dotfiles/cursor/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
            break
            ;;
        "Skip ⏭ ")
            echo -e "${RED}⏭  skipping editor settings...${NC}"
            break
            ;;
    esac
done

echo -e "${GREEN}✨ done! restart your apps to see changes${NC}"