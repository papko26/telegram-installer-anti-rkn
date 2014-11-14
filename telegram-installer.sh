#!/bin/bash

echo "============================================="
echo "==     Telegram Script Installer v 0.1     =="
echo "==                                         =="
echo "==            by Jalcaldea                 =="
echo "============================================="

echo "Downloading necesary files..."

cd /tmp
wget -O - https://tdesktop.com/linux > tsetup.tar.gz
wget -O - https://raw.githubusercontent.com/telegramdesktop/tdesktop/master/Telegram/Telegram/Images.xcassets/Icon.iconset/icon_256x256@2x.png > icon.png

echo "Making destination folder..."

sudo mkdir /usr/share/telegram
sudo chmod +x /usr/share/telegram

echo "Extracting files..."

tar -xvJf tsetup.tar.gz
cd ./Telegram

echo "Copying new files..."
sudo cp ./Updater /usr/share/telegram/Updater
sudo cp ./Telegram /usr/share/telegram/Telegram
user=$(whoami)
sudo chown -R $user:$user /usr/share/telegram/.

echo "Making desktop files..."

cd /tmp

sudo echo "[Desktop Entry]" > telegram.desktop
sudo echo "Name=Telegram" >> telegram.desktop
sudo echo "GenericName=Chat" >> telegram.desktop
sudo echo "Comment=Chat with yours friends" >> telegram.desktop
sudo echo "Exec=/usr/share/telegram/Telegram" >> telegram.desktop
sudo echo "Terminal=false" >> telegram.desktop
sudo echo "Type=Application" >> telegram.desktop
sudo echo "Icon=/usr/share/telegram/icon.png" >> telegram.desktop
sudo echo "Categories=Network;Chat;" >> telegram.desktop
sudo echo "StartupNotify=false" >> telegram.desktop

sudo cp icon.png /usr/share/telegram/icon.png
sudo cp telegram.desktop /usr/share/applications/telegram.desktop

echo "Removing old files..."

rm /tmp/tsetup.tar.gz
rm /tmp/icon.png
rm /tmp/telegram.desktop
rm -R /tmp/Telegram


echo "Installation Complete! Launching Telegram..."

/usr/share/telegram/Updater &
