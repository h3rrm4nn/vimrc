#!/bin/bash

echo 'set runtimepath+=~/vimrc

runtime vimrcs/basic.vim
runtime vimrcs/filetypes.vim
runtime vimrcs/plugins_config.vim
runtime vimrcs/extended.vim

try
runtime my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the advanced Vim configuration."
