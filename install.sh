#!/bin/bash

echo "Installing dependencies..."

# neovim dependencies
sudo apt update
sudo apt install -y gcc g++ default-jdk nodejs npm unzip fd-find sqlite3 clangd tree

# npm global packages
sudo npm install -g live-server

# python packages
pip install black isort pylint numpy pandas matplotlib seaborn scikit-learn --break-system-packages

# win32yank for clipboard
curl -L -o /tmp/win32yank.zip "https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip"
unzip /tmp/win32yank.zip -d /tmp/win32yank
sudo mv /tmp/win32yank/win32yank.exe /usr/local/bin/
sudo chmod +x /usr/local/bin/win32yank.exe

# clone nvim config
git clone https://github.com/yourusername/dotfiles.git ~/.config/nvim

echo "Done! Open nvim and run :Lazy to install plugins"
