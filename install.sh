#!/usr/bin/bash
set -e

if [ "`whoami`" == "root" ]; then
  echo "Do not run with root privileges"
  exit 1
fi

sudo apt install wget -y
cd ~
wget "https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_386.tar.gz"
tar xzvf peco_linux_386.tar.gz
chmod +x peco_linux_386/peco
sudo cp peco_linux_386/peco /usr/local/bin
git clone https://github.com/b4b4r07/enhancd
echo source ~/enhancd/init.sh >> .zshrc
rm peco_linux_386.tar.gz
rm -rf peco_linux_386
exec $SHELL -l
