set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-eunuch'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'dense-analysis/ale'

call vundle#end()

filetype plugin indent on

syntax on
set noswapfile
set number
set nowrap
set backspace=indent,eol,start
set incsearch
set rnu
set laststatus=2
set t_Co=256
set clipboard=unnamedplus
let g:airline_theme = 'base16_default'
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'z'    : '#H'}
