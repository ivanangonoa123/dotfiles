#!/bin/bash
log_file=~/install_progress_log.txt

sudo apt-get -y install curl

if type -p curl > /dev/null; then
    echo "curl Installed" >> $log_file
else
    echo 'curl failed' >> $log_file
fi

# Install node
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs

if type -p node > /dev/null; then
    echo -n "Node version: "; echo -n `node --version`; echo " Installed" >> $log_file
else
    echo "node FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install npm

if type -p curl > /dev/null; then
    echo "npm Installed" >> $log_file
else
    echo 'npm failed' >> $log_file
fi

#git-open command
npm install --global git-open
if type -p git-open > /dev/null; then
    echo "git-open Installed" >> $log_file
else
    echo 'git-open failed' >> $log_file
fi

sudo apt-get -y install tmux

if type -p tmux > /dev/null; then
    echo "tmux Installed" >> $log_file
else
    echo 'tmux failed' >> $log_file
fi

sudo apt-get -y install guake

if type -p guake > /dev/null; then
    echo "guake Installed" >> $log_file
else
    echo 'guake failed' >> $log_file
fi

#sublime
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install -y sublime-text-installer

#pm-utils
sudo apt -y install pm-utils
if type -p pm-utils > /dev/null; then
    echo "pm-suspend Installed" >> $log_file
else
    echo 'pm-suspend failed' >> $log_file
fi

#xclip command
sudo apt-get -y install xclip
if type -p xclip > /dev/null; then
    echo "xclip Installed" >> $log_file
else
    echo 'xclip failed' >> $log_file
fi

#=============
# The end
#==============
cat $log_file
echo 'olrait'
echo
rm $log_file
