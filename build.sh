#!/bin/bash


REPO_DIR="${REPO_DIR:-code}"
VIMRC_LINK_TARGET="${REPO_DIR}/vim_stuffs/vimrc"

# let's not make people hate us
if [ -f ~/.vimrc -a ! -L ~/.vimrc ]; then
  echo "ERROR!" >&2
  echo "Your ~/.vimrc file is not a symlink.  As a safety precaution you must first move (ideally" >&2
  echo "to a backup location) ~/.vimrc before this program is allowed to manage your vim setup" >&2
  exit 1
fi


# help
if [ "$1" == "-h" ]; then
  echo "$0 [ -u | -c | -h ]"
  echo "      Normal mode: Creates ~/${REPO_DIR} (can override with \$REPO_DIR env var), clones"
  echo "                   the repo this lives in as well as ~/.vim and the ~/.vimrc symlink,"
  echo "                   then clones the dependant repos and colorpack, then finally backs"
  echo "                   up and links your .vimrc to ~/${REPO_DIR}/vim_stuffs/vimrc"
  echo "  -u  Update mode: Pulls in each repo it finds under ~/.vim, then runs as normal"
  echo "  -c  Clean mode : Removes ~/.vim and the ~/.vimrc symlink, but not the"
  echo "                   ~/${REPO_DIR}/vim_stuffs repo"
  echo "  -h  Help mode  : This help info"
  exit 0
fi

# dep check
if ! which wget >/dev/null; then
  echo "Requires wget" >&2
  exit 2
fi

# update mode
if [ "$1" == "-u" ]; then
  echo "Updating repos in parallel"
  if [ ! -d ~/.vim ]; then
    echo "Creating ~/.vim"
    mkdir ~/.vim
  fi
  cd ~/.vim/
  for dir in $(find . -name ".git" -type d); do
    rel_dir=$(dirname $dir)
    echo "Updating ${rel_dir}"
    pushd "${rel_dir}" >/dev/null
    git pull >/dev/null &
    popd >/dev/null
  done
  wait
  echo "Finished updates"
fi

# clean mode
if [ "$1" == "-c" ]; then
  rm -rf ~/.vim
  rm -f ~/.vimrc
  echo "All clean"
  exit 0
fi

# dependencies for non-mac
if ! uname -a | grep -q ^Darwin; then
  for pkg in 'curl' 'git' 'exuberant-ctags'; do
  if ! dpkg -l | grep -q $pkg; then
    sudo apt-get install -y $pkg 
  fi
  done
fi

# project dir
cd ~
if [ ! -d "${REPO_DIR}" ]; then
  echo "Creating dir ${REPO_DIR}"
  mkdir "${REPO_DIR}"
fi

# teh repo
cd ${REPO_DIR}
if [ ! -d "vim_stuffs" ]; then
  echo "Cloning vim_stuffs"
  git clone https://github.com/zonk1024/vim_stuffs.git 2>/dev/null
fi

# relink .vimrc
cd ~
rm -f .vimrc
ln -s ${VIMRC_LINK_TARGET} .vimrc

# Pathogen
[ ! -d ~/.vim/autoload ] && mkdir -p ~/.vim/autoload
if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
  echo "Downloading pathogen"
  wget -O ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim 2>/dev/null
fi

# Plugins from github
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
echo "Cloning any missing repos in parallel"
[ ! -d badwolf ]                 && echo "Cloning: badwolf"                 && git clone https://github.com/sjl/badwolf.git 2>/dev/null &
[ ! -d bclose.vim ]              && echo "Cloning: bclose.vim"              && git clone https://github.com/rbgrouleff/bclose.vim.git 2>/dev/null &
[ ! -d ctrlp.vim ]               && echo "Cloning: ctrlp.vim"               && git clone https://github.com/kien/ctrlp.vim.git 2>/dev/null &
[ ! -d matchit ]                 && echo "Cloning: matchit"                 && git clone https://github.com/tmhedberg/matchit.git 2>/dev/null &
[ ! -d minibufexpl.vim ]         && echo "Cloning: minibufexpl.vim"         && git clone https://github.com/fholgado/minibufexpl.vim.git 2>/dev/null &
[ ! -d nerdtree ]                && echo "Cloning: nerdtree"                && git clone https://github.com/scrooloose/nerdtree.git 2>/dev/null &
[ ! -d python-mode ]             && echo "Cloning: python-mode"             && git clone https://github.com/klen/python-mode.git 2>/dev/null &
[ ! -d rainbow_parentheses.vim ] && echo "Cloning: rainbow_parentheses.vim" && git clone https://github.com/kien/rainbow_parentheses.vim.git 2>/dev/null &
[ ! -d supertab ]                && echo "Cloning: supertab"                && git clone https://github.com/ervandew/supertab.git 2>/dev/null &
[ ! -d vim-commentary ]          && echo "Cloning: vim-commentary"          && git clone https://github.com/tpope/vim-commentary.git 2>/dev/null &
[ ! -d vim-easymotion ]          && echo "Cloning: vim-easymotion"          && git clone https://github.com/Lokaltog/vim-easymotion.git 2>/dev/null &
[ ! -d vim-fugitive ]            && echo "Cloning: vim-fugitive"            && git clone https://github.com/tpope/vim-fugitive.git 2>/dev/null &
[ ! -d vim-gitgutter ]           && echo "Cloning: vim-gitgutter"           && git clone https://github.com/airblade/vim-gitgutter.git 2>/dev/null &
[ ! -d vim-markdown ]            && echo "Cloning: vim-markdown"            && git clone https://github.com/tpope/vim-markdown.git 2>/dev/null &
[ ! -d vim-powerline ]           && echo "Cloning: vim-powerline"           && git clone https://github.com/Lokaltog/vim-powerline.git 2>/dev/null &
[ ! -d vim-repeat ]              && echo "Cloning: vim-repeat"              && git clone https://github.com/tpope/vim-repeat.git 2>/dev/null &
[ ! -d vim-sensible ]            && echo "Cloning: vim-sensible"            && git clone https://github.com/tpope/vim-sensible.git 2>/dev/null &
[ ! -d vim-speeddating ]         && echo "Cloning: vim-speeddating"         && git clone https://github.com/tpope/vim-speeddating.git 2>/dev/null &
[ ! -d vim-surround ]            && echo "Cloning: vim-surround"            && git clone https://github.com/tpope/vim-surround.git 2>/dev/null &
[ ! -d vim-unimpaired ]          && echo "Cloning: vim-unimpaired"          && git clone https://github.com/tpope/vim-unimpaired.git 2>/dev/null &
wait
echo "Done cloning repos"

# Colors! :D
cd ~/.vim
if [ ! -f ColorSamplerPack.zip ]; then
  echo "Downloading ColorSamplerPack.zip"
  curl -o ColorSamplerPack.zip 'https://www.vim.org/scripts/download_script.php?src_id=18915' 2>/dev/null
  if [ $? -ne 0 ]; then
    echo "FAILED TO DOWNLOAD ColorSamplerPack.zip" >&2
    exit 3
  fi
fi

[ ! -d plugin ] && mkdir plugin
if [ ! -f plugin/color_sample_pack.vim ]; then
  echo "Unzipping ColorSamplerPack.zip"
  unzip ColorSamplerPack.zip >/dev/null
fi

echo "Done"
