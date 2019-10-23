VIMRC=~/.vimrc
if test -f "$VIMRC"; then
    rm $VIMRC
fi
ln -s vimrcs/basic.vim .vimrc
echo "Installed the basic Vim configuration."
