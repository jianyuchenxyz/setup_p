#!/bin/bash
set -x  # echo commands

# repository updates
sudo add-apt-repository -y ppa:neovim-ppa/stable # for neovim v0.7+

# package updates
sudo apt update
for i in $(cat os/apt/necessary_packages.txt); do
    sudo apt-get install -y $i;
done

# virtualbox guest additions
sudo apt-get install -y virtualbox-guest-additions-iso
sudo mount /usr/share/virtualbox/VBoxGuestAdditions.iso /mnt
sudo /mnt/VBoxLinuxAdditions.run

# sound
pulseaudio --start

# ~/.bashrc
cat os/dotfiles/.bashrc >> ~/.bashrc
source ~/.bashrc

# ~/.profile, startup xserver after login
echo "startx" >> ~/.profile

# neovim
mkdir -p ~/.local/share/nvim/site/autoload
cp os/nvim/plug.vim ~/.local/share/nvim/site/autoload/
mkdir -p ~/.config/nvim
cp os/nvim/init.vim ~/.config/nvim/
cp -r os/nvim/lua ~/.config/nvim
nvim --headless +PlugInstall +qa # might not be stable

# create setup directory
mkdir -p ~/.setup

# build C utilities
mkdir -p ~/.setup/utils
gcc os/utils/get_uptime.c -o os/utils/get_uptime
gcc os/utils/get_storage.c -o os/utils/get_storage
cp os/utils/* ~/.setup/utils/

# suckless, install directly from repository so configs can be pulled remotely
sudo make -C os/dwm clean install
sudo make -C os/dmenu clean install
sudo make -C os/st clean install
sudo make -C os/dwmblocks clean install

# include fonts in dir '~/.fonts'
mkdir -p ~/.fonts
cp os/fonts/* ~/.fonts/

# include wallpapers in dir '~/wallpapers'
mkdir -p ~/.setup/wallpapers
cp os/wallpapers/* ~/.setup/wallpapers/

# setup dotfiles
cp os/dotfiles/.fehbg ~/.fehbg

# GDM login does not seem to source ~/.xinitrc or ~/.xprofile on Ubuntu Desktops
cp os/dotfiles/.xinitrc ~/.xinitrc
cp os/dotfiles/.xprofile ~/.xprofile

# epy, ebook reader
pip3 install epy-reader

# newsboat, rss reader
mkdir -p ~/.newsboat
cp os/newsboat/urls ~/.newsboat/

# remove unwanted packages
for i in $(cat os/apt/unwanted_packages.txt); do
    sudo apt remove -y $i;
done

# cleanup
sudo apt -y autoremove

# remove empty home directories except 'Desktop' and 'Downloads'
if [ ! "$(ls -A ~/Documents)" ]; then
    rm -rf ~/Documents
fi

if [ ! "$(ls -A ~/Music)" ]; then
    rm -rf ~/Music
fi

if [ ! "$(ls -A ~/Pictures)" ]; then
    rm -rf ~/Pictures
fi

if [ ! "$(ls -A ~/Public)" ]; then
    rm -rf ~/Public
fi

if [ ! "$(ls -A ~/Templates)" ]; then
    rm -rf ~/Templates
fi

if [ ! "$(ls -A ~/Videos)" ]; then
    rm -rf ~/Videos
fi
