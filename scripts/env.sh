#!/bin/bash

CURRENT_DIR=$(pwd)
VUNDLE_GIT=https://github.com/VundleVim/Vundle.vim.git

mkdir -p ~/scripts
mkdir -p ~/projects
mkdir -p ~/samples
mkdir -p ~/trash
mkdir -p ~/bugs
mkdir -p ~/repos
mkdir -p ~/templates

cp ../templates/i3config ~/.config/i3/config
cp ../images/background.png ~/Pictures/
cp ../images/lock.png ~/Pictures/
touch ~/scripts/lock.sh && chmod +x ~/scripts/lock.sh
LOCK_PATH=$(realpath ~/Pictures/lock.png)
echo "#!/bin/bash" > ~/scripts/lock.sh
echo "i3lock -i \"$LOCK_PATH\" --ignore-empty-password --show-failed-attempts --nofork" >> ~/scripts/lock.sh
echo "xset s off s noblank -dpms" >> ~/scripts/lock.sh
unset LOCK_PATH
cp ../templates/ports.sh ~/scripts/ports.sh
cp ../templates/vimrc ~/.vimrc

if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
    git clone $VUNDLE_GIT ~/.vim/bundle/Vundle.vim
fi

vim -c ":PluginInstall" -c ":qa"
grep -qxF 'EDITOR=vim' ~/.profile || echo 'EDITOR=vim' >> ~/.profile

if [ ! -e /opt/gobin ]; then
    sudo ln -s $(realpath ~/go/bin) /opt/gobin
fi

if [ ! -f /etc/profile.d/gopath.sh ]; then
   sudo cp ../templates/gopath.sh /etc/profile.d/gopath.sh
fi

vim -c ":GoInstallBinaries" -c ":qa"

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
cd $CURRENT_DIR

cd $CURRENT_DIR
