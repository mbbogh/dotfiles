" only change after ----

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible              " be iMproved, required
filetype off                  " required

"""
""" Vundle: https://github.com/VundleVim/Vundle.vim
"""
" on new PC clone vundle.vim from github into .vim/bundle, start vim and :PluginInstall
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'Valloric/YouCompleteMe' --- looks like specific for programming languages
"Plugin 'SirVer/ultisnips' --- more like in emacs?
Plugin 'davidoc/taskpaper.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" -------------------------------------------------------------------------------------------

set guioptions-=M  "don't source menu script
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"""
""" seen somewhere and added
"""
set relativenumber           " show the line number relative to the cursor
set number

"from http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
"should use C-indenting --- but havent found good example yet
"update after watching vimcasts.org number 2 --- so far not sure which ident
"messod to use
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


" incremenatal search
set incsearch
" ignore case till a upper case letter is typed
set ignorecase
set smartcase

"set spell
"set spelllang=de

" to map the alt key <ALT+k> <A-k> or <M-k>
" it looks like it is different on many systems
" on OS X one is useing the "displayed character"
" http://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
noremap <A-p> "*p
nnoremap <A-c> "*yy
vnoremap <A-c> "*y
" I looks like paste is working from OS clipboard but not the copy
" surce is
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" http://vim.wikia.com/wiki/VimTip21


" display all used keys
" :help index --- internal
" :map        --- selbst erstellte
" :map!       --- commands from insert and command mode
" :vmap       --- every map command can be used like to display it set key
" 
" I should read the following tutorial
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)


" from https://github.com/altercation/vim-colors-solarized via http://technicaldifficulties.us/episodes/077-learning-vim-with-potatowire
syntax enable
" if has('gui_running')
"     set background=light
" else
"     set background=dark
" endif
" "colorscheme solarized


let g:ycm_confirm_extra_conf = 0
let g:ycm_extra_conf_globlist = ['~/.vim/bundle/*','~/.ycm_confirm_extra_conf.py*']

