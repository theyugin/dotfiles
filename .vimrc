set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-eunuch'

call vundle#end()

filetype plugin indent on
autocmd InsertEnter,InsertLeave * set cul!

syntax on
set noswapfile
set number
set nowrap
set backspace=indent,eol,start
set incsearch
set rnu
set laststatus=2
set t_Co=256
