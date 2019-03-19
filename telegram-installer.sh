#!/bin/bash

echo "=============================="
echo "Credits to Jalcaldea."
echo "This version is for russian users, who are having an issues while loading telegram binary, because of RKN censorship."
echo "On another hand, I am not creating desktop file, but creating symlink from updater to /usr/sbin/ named as 'telegram' "
echo "=============================="
echo ""
echo "I need to use superuser priveleges to get acces for /usr/share and /usr/sbin:"
sudo mkdir -p /usr/share/telegram

last_release=$(curl --silent "https://api.github.com/repos/telegramdesktop/tdesktop/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
last_release_num=$(echo $last_release | tr -d "v")
load_link="https://github.com/telegramdesktop/tdesktop/releases/download/$last_release/tsetup.$last_release_num.tar.xz"
echo "Downloading necesary files..."

cd /tmp
wget -q -O - $load_link > tsetup.tar.gz

echo "Extracting files..."

tar -xvJf tsetup.tar.gz
cd ./Telegram

echo "Copying new files..."
sudo cp ./Updater /usr/share/telegram/Updater
sudo cp ./Telegram /usr/share/telegram/Telegram
sudo chmod a+x /usr/share/telegram/Telegram
sudo chmod a+x /usr/share/telegram/Updater

echo "Making symlink..."
sudo ln -s /usr/share/telegram/Updater /usr/sbin/telegram

cd /tmp
echo "Removing old files..."

rm /tmp/tsetup.tar.gz
rm -R /tmp/Telegram


echo "Installation Complete! call 'telegram' to start it"
