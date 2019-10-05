#!/bin/bash

mkdir -p ~/scripts
mkdir -p ~/projects
mkdir -p ~/samples
mkdir -p ~/trash
mkdir -p ~/bugs

cp ../templates/i3config ~/.config/i3/config
cp ../images/background.png ~/Pictures/
cp ../images/lock.png ~/Pictures/
touch ~/scripts/lock.sh && chmod +x ~/scripts/lock.sh
LOCK_PATH=$(realpath ~/Pictures/lock.png)
echo "#!/bin/bash" > ~/scripts/lock.sh
echo "i3lock -i \"$LOCK_PATH\" --ignore-empty-password --show-failed-attempts --nofork" >> ~/scripts/lock.sh
echo "xset s off s noblank -dpms" >> ~/scripts/lock.sh
unset LOCK_PATH
