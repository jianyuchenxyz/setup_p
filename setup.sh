#!/bin/bash
set -x  # echo commands

# repository updates
sudo add-apt-repository -y ppa:neovim-ppa/stable # for neovim v0.7+

# package updates
sudo apt update
for i in $(cat apt/install.txt); do
    sudo apt-get install -y $i;
done

# sound
pulseaudio --start

# ~/.bashrc
cat dotfiles/.bashrc >> ~/.bashrc
source ~/.bashrc

# ~/.profile, startup xserver after login
cat dotfiles/.profile >> ~/.profile

# neovim
mkdir -p ~/.local/share/nvim/site/autoload
cp nvim/plug.vim ~/.local/share/nvim/site/autoload/
mkdir -p ~/.config/nvim
cp nvim/init.vim ~/.config/nvim/
cp -r nvim/lua ~/.config/nvim
nvim --headless +PlugInstall +qa # might not be stable

# create setup directory
mkdir -p ~/.setup

# build C utilities
mkdir -p ~/.setup/utils
gcc utils/get_uptime.c -o utils/get_uptime
gcc utils/get_storage.c -o utils/get_storage
cp utils/* ~/.setup/utils/

# suckless, install directly from repository so configs can be pulled remotely
sudo make -C dwm clean install
sudo make -C dmenu clean install
sudo make -C st clean install
sudo make -C dwmblocks clean install

# include fonts in dir '~/.fonts'
mkdir -p ~/.fonts
cp fonts/* ~/.fonts/

# include wallpapers in dir '~/wallpapers'
mkdir -p ~/.setup/wallpapers
cp wallpapers/* ~/.setup/wallpapers/

# setup dotfiles
cp dotfiles/.fehbg ~/.fehbg

# GDM login does not seem to source ~/.xinitrc or ~/.xprofile on Ubuntu Desktops
cp dotfiles/.xinitrc ~/.xinitrc
cp dotfiles/.xprofile ~/.xprofile

# epy, ebook reader
pip3 install epy-reader

# newsboat, rss reader
mkdir -p ~/.newsboat
cp newsboat/urls ~/.newsboat/

# virtualbox guest additions
sudo apt-get install -y virtualbox-guest-additions-iso
sudo mount /usr/share/virtualbox/VBoxGuestAdditions.iso /mnt
sudo /mnt/VBoxLinuxAdditions.run

# remove unwanted packages
for i in $(cat apt/remove.txt); do
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

# disable startup services
for i in $(cat services/disable.txt); do
    sudo systemctl disable $i;
done
