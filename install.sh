#! /bin/bash

# Bash script for install and construct development environment.
# Junseong Lee, a.k.a hodduc.
# 2013-07-29

# Check prerequisite
if [ ! -x /bin/tar -o -x /usr/bin/tar ]; then
    echo 'Install tar/gz to continue.'
    exit 1
fi

if [ ! -x /usr/bin/curl -o -x /bin/curl ]; then
    echo 'Install curl to continue.'
    exit 1
fi

if [ ! -x /usr/bin/git -o -x /bin/git ]; then
    echo 'Install git to continue.'
    exit 1
fi

# Generate working dir
WORK_DIR=$HOME/.dotfiles_tmp
rm -rf $WORK_DIR && mkdir -p $WORK_DIR

# Clone dotfiles repo from github and extract it
git clone --recursive https://github.com/hodduc/dotfiles $WORK_DIR/

# Install vimscript
echo -n 'Install vimscript ...'

rm -f $HOME/.vimrc
cp $WORK_DIR/vim/vimrc $HOME/.vimrc

rm -rf $HOME/.vim
mkdir -p $HOME/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

echo 'Done.'

# Install gitconfig


# Clean up
rm -rf $WORK_DIR
exit
