#!/bin/bash

[ ! -f "~/.vimrc" ] && curl -o ~/.vimrc https://raw.github.com/zonk1024/vim_stuffs/master/vimrc

[ ! -d "~/.vim/autoload" ] && mkdir -p ~/.vim/autoload
[ ! -f "~/.vim/autoload/pathogen.vim" ] && curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

[ ! -d "~/.vim/bundle" ]   && mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
[ ! -d "TaskList.vim" ]            && git clone git@github.com:vim-scripts/TaskList.vim.git
[ ! -d "ctrlp.vim" ]               && git clone git@github.com:kien/ctrlp.vim.git
[ ! -d "gundo.vim" ]               && git clone git@github.com:sjl/gundo.vim.git
[ ! -d "minibufexpl.vim" ]         && git clone git@github.com:fholgado/minibufexpl.vim.git
[ ! -d "mru.vim" ]                 && git clone git@github.com:vim-scripts/mru.vim.git
[ ! -d "nerdtree" ]                && git clone git@github.com:scrooloose/nerdtree.git
[ ! -d "python-mode" ]             && git clone git@github.com:klen/python-mode.git
[ ! -d "rainbow_parentheses.vim" ] && git clone git@github.com:kien/rainbow_parentheses.vim.git
[ ! -d "supertab" ]                && git clone git@github.com:ervandew/supertab.git
[ ! -d "tagbar" ]                  && git clone git@github.com:majutsushi/tagbar.git
[ ! -d "vim-afterimage" ]          && git clone git@github.com:tpope/vim-afterimage.git
[ ! -d "vim-commentary" ]          && git clone git@github.com:tpope/vim-commentary.git
[ ! -d "vim-easymotion" ]          && git clone git@github.com:Lokaltog/vim-easymotion.git
[ ! -d "vim-eunuch" ]              && git clone git@github.com:tpope/vim-eunuch.git
[ ! -d "vim-fugitive" ]            && git clone git@github.com:tpope/vim-fugitive.git
[ ! -d "vim-markdown" ]            && git clone git@github.com:tpope/vim-markdown.git
[ ! -d "vim-matchit" ]             && git clone git@github.com:tsaleh/vim-matchit.git
[ ! -d "vim-pastie" ]              && git clone git@github.com:tpope/vim-pastie.git
[ ! -d "vim-repeat" ]              && git clone git@github.com:tpope/vim-repeat.git
[ ! -d "vim-sensible" ]            && git clone git@github.com:tpope/vim-sensible.git
[ ! -d "vim-sleuth" ]              && git clone git@github.com:tpope/vim-sleuth.git
[ ! -d "vim-speeddating" ]         && git clone git@github.com:tpope/vim-speeddating.git
[ ! -d "vim-surround" ]            && git clone git@github.com:tpope/vim-surround.git

# Colors! :D
cd ~/.vim
if [ ! -f "plugin/color_sample_pack.vim" ]; then
    curl "http://www.vim.org/scripts/download_script.php?src_id=18915" > ColorSamplerPack.zip
    unzip ColorSamplerPack.zip
fi
