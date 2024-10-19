#!/bin/bash
#install docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#install vscode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
#install packages
sudo apt install git kde-plasma-desktop  fonts-hack-ttf code apt-transport-https openresolv latte-dock zsh timeshift konsole sddm ark zip unzip   -y
sudo apt install flameshot transmission krita neofetch elisa ffmpeg lame flatpak network-manager pulseaudio-module-bluetooth plasma-nm dolphin wireguard inkscape libreoffice -y
#install flathub apps 
flatpak install flathub org.libretro.RetroArch
flatpak install flathub org.kde.isoimagewriter
#install theme
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
git clone https://github.com/semichuk/linux-icon-theme.git
git clone https://github.com/semichuk/linux-cursors.git
git clone https://github.com/semichuk/kde-rounded-corners.git
git clone https://github.com/semichuk/plasma-active-application.git
git clone https://github.com/semichuk/linux-kde-theme.git
git clone https://github.com/semichuk/minimal-install-terminal.git

sudo bash linux-icon-theme/install.sh -b
sudo bash linux-cursor/install.sh
plasmapkg2 -i plasma-active-application
sudo bash linux-kde-theme/install.sh -w sharp
sudo apt install git cmake g++ extra-cmake-modules kwin-dev libkf5configwidgets-dev -y
cd kde-rounded-corners
mkdir build
cd build
cmake ..
cmake --build . -j
sudo make install
cd ..
cd ..
sudo bash minimal-install-terminal/install.sh
