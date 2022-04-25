#!/bin/bash


REPO_DIR="${REPO_DIR:-code}"
VIMRC_LINK_TARGET="${REPO_DIR}/vim_stuffs/vimrc"

# update mode
if [ "$1" == "-u" ]; then
    cd ~/.vim/
    for dir in $(find . -name ".git" -type d); do
	cd $(dirname $dir) && git pull &
    done
    wait
    exit 0
fi

#for dir in $(for d in $(find . -name ".git" -type d); do dirname $d; done); do cd $dir && git pull & done

# dependencies
if ! uname -a | grep -q ^Darwin; then
    for pkg in 'curl' 'git' 'exuberant-ctags'; do
	if ! dpkg -l | grep -q $pkg; then
	    sudo apt-get install -y $pkg 
	fi
    done
fi

# project dir
[ ! -d "${REPO_DIR}" ] && mkdir "${REPO_DIR}"

# teh repo
if [ ! -d "${REPO_DIR}/vim_stuffs" ]; then
    cd ${REPO_DIR}
    git clone https://github.com/zonk1024/vim_stuffs.git
fi

# relink .vimrc
cd ~
rm -f .vimrc
ln -s ${VIMRC_LINK_TARGET} .vimrc

# Pathogen
[ ! -d ~/.vim/autoload ] && mkdir -p ~/.vim/autoload
[ ! -f ~/.vim/autoload/pathogen.vim ] && wget -O ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Plugins from github
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
[ ! -d badwolf ]                 && git clone https://github.com/sjl/badwolf.git
[ ! -d bclose.vim ]              && git clone https://github.com/rbgrouleff/bclose.vim.git
[ ! -d ctrlp.vim ]               && git clone https://github.com/kien/ctrlp.vim.git
[ ! -d matchit ]                 && git clone https://github.com/tmhedberg/matchit.git
[ ! -d minibufexpl.vim ]         && git clone https://github.com/fholgado/minibufexpl.vim.git
[ ! -d nerdtree ]                && git clone https://github.com/scrooloose/nerdtree.git
[ ! -d python-mode ]             && git clone https://github.com/klen/python-mode.git
[ ! -d rainbow_parentheses.vim ] && git clone https://github.com/kien/rainbow_parentheses.vim.git
[ ! -d supertab ]                && git clone https://github.com/ervandew/supertab.git
[ ! -d vim-commentary ]          && git clone https://github.com/tpope/vim-commentary.git
[ ! -d vim-easymotion ]          && git clone https://github.com/Lokaltog/vim-easymotion.git
[ ! -d vim-fugitive ]            && git clone https://github.com/tpope/vim-fugitive.git
[ ! -d vim-gitgutter ]           && git clone https://github.com/airblade/vim-gitgutter.git
[ ! -d vim-markdown ]            && git clone https://github.com/tpope/vim-markdown.git
[ ! -d vim-powerline ]           && git clone https://github.com/Lokaltog/vim-powerline.git
[ ! -d vim-repeat ]              && git clone https://github.com/tpope/vim-repeat.git
[ ! -d vim-sensible ]            && git clone https://github.com/tpope/vim-sensible.git
[ ! -d vim-speeddating ]         && git clone https://github.com/tpope/vim-speeddating.git
[ ! -d vim-surround ]            && git clone https://github.com/tpope/vim-surround.git
[ ! -d vim-unimpaired ]          && git clone https://github.com/tpope/vim-unimpaired.git
# [ ! -d TaskList.vim ]            && git clone https://github.com/vim-scripts/TaskList.vim.git
# [ ! -d gundo.vim ]               && git clone https://github.com/sjl/gundo.vim.git
# [ ! -d mru.vim ]                 && git clone https://github.com/vim-scripts/mru.vim.git
# [ ! -d tagbar ]                  && git clone https://github.com/majutsushi/tagbar.git
# [ ! -d vim-afterimage ]          && git clone https://github.com/tpope/vim-afterimage.git
# [ ! -d vim-arduino ]             && git clone https://github.com/tclem/vim-arduino.git
# [ ! -d vim-distinguished.vim ]   && git clone https://github.com/Lokaltog/vim-distinguished.git
# [ ! -d vim-eunuch ]              && git clone https://github.com/tpope/vim-eunuch.git
# [ ! -d vim-pastie ]              && git clone https://github.com/tpope/vim-pastie.git
# [ ! -d vim-sleuth ]              && git clone https://github.com/tpope/vim-sleuth.git
# [ ! -d vim-stylus ]              && git clone https://github.com/wavded/vim-stylus.git

# Colors! :D
cd ~/.vim

if [ ! -f ColorSamplerPack.zip ]; then
    echo "Downloading ColorSamplerPack.zip"
    curl -o ColorSamplerPack.zip 'https://www.vim.org/scripts/download_script.php?src_id=18915' 2>/dev/null >&2
    if [ $? -ne 0 ]; then
        echo "FAILED TO DOWNLOAD ColorSamplerPack.zip"
        exit 1
    fi
fi

[ ! -d plugin ] && mkdir plugin
[ ! -f plugin/color_sample_pack.vim ] && unzip ColorSamplerPack.zip >/dev/null
