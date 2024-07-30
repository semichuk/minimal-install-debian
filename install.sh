#!/bin/bash
#install vscode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
#install packages
sudo apt update
sudo apt install fonts-hack-ttf gnome-shell gnome-terminal timeshift gnome-tweaks flatpak zsh transmission libreoffice code apt-transport-https gnome-system-monitor wireguard openresolv
#install flathub apps 
sudo flatpak install flathub com.mattjakeman.ExtensionManager
sudo flatpak install flathub io.gitlab.adhami3310.Impression
sudo flatpak install flathub com.github.tchx84.Flatseal 
sudo flatpak override --filesystem=$HOME/.themes       
sudo flatpak override --filesystem=$HOME/.icons