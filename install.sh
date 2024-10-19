#!/bin/bash
sudo apt update
#install vscode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
#install packages
sudo apt kde-plasma-desktop install fonts-hack-ttf  timeshift  flatpak zsh transmission libreoffice code apt-transport-https wireguard openresolv -y
#install flathub apps 
flatpak install flathub org.libretro.RetroArch
flatpak install flathub org.kde.isoimagewriter
