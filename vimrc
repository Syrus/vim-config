" Syrus's vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'python.vim'
Plugin 'TVO--The-Vim-Outliner'
Plugin 'TextFormat'
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

" My bundles
"Bundle 'pyflakes'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'a.vim'
"Bundle 'c.vim'
"Bundle 'Vim-R-plugin'
"Bundle 'python.vim'
"Bundle 'octave.vim'
"Bundle 'vim-pandoc/vim-pandoc'
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'snipmate-snippets'
"Bundle 'garbas/vim-snipmate'
"Bundle 'tpope/vim-fugitive'
"Bundle 'ervandew/screen'
" vim-scripts repos
"Bundle 'TVO--The-Vim-Outliner'
"Bundle 'TextFormat'

set autoindent
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
    let g:solarized_termcolors=16
    let g:solarized_termtrans=1
    let g:solarized_visibility="low"
endif
colorscheme solarized

" Old vimrc settings below
set visualbell " no beep
set history=1000 " number of commands and search patterns to save
set ttyfast
set backspace=indent,eol,start " allow bs over EOL, indent, and start of insert
set incsearch " incremental search
set nojoinspaces " use only one space when joining lines
set matchpairs+=<:> " add < > to chars that form pairs (see % command)
set showmatch " show matching brackets by flickering cursor
set showcmd " show partial command in status line
set nowrap
set laststatus=2 " always show statusline
set statusline=%n\ %1*%h%f%*\ %=%<[%3lL,%2cC]\ %2p%%\ 0x%02B%r%m
set ruler " show ruler, but only shown if laststatus is off
set rulerformat=%h%r%m%=%f " sane value in case laststatus is off
set nonumber " don't show line numbers
set wildmenu " show a menu of matches when doing completion
set hlsearch " highlight the current search pattern
set title " shows the current filename and path in the term title.
nnoremap <silent><CR> :nohlsearch<CR><CR> " in normal mode, enter clears search highlight
nnoremap <F2> :set nonumber!<CR>h " in normal mode, F2 key toggles line numbering
set numberwidth=6 " width of line numbers
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
" Octave syntax
au BufNewFile,BufRead *.m     setf octave
au BufNewFile,BufRead *.m     set syntax=matlab
" Use keywords from Octave syntax language file for autocomplete
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype octave
    \ if &omnifunc == "" |
    \ setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif 
" Setup R plugin
let vimrplugin_r_args = "--no-save --no-restore"
let vimrplugin_routmorecolors = 1
" tab settings
set tabstop=4|set shiftwidth=4|set expandtab|set smartindent " default

" insert dat stamp by typing 'dts' in insert mode
:iab <expr> dts strftime("%a %d %b %Y")

" use Ctrl-F for Omnni Completion
imap <C-F> 

" textformat settings
nmap <S-F5> <Plug>Quick_Align_Paragraph_Left
nmap <S-F6> <Plug>Quick_Align_Paragraph_Right
nmap <S-F7> <Plug>Quick_Align_Paragraph_Justify
nmap <S-F8> <Plug>Quick_Align_Paragraph_Center

vmap <S-F5> <Plug>Align_Range_Left
vmap <S-F6> <Plug>Align_Range_Right
vmap <S-F7> <Plug>Align_Range_Justify
vmap <S-F8> <Plug>Align_Range_Center

" defaults:
let otl_install_menu=1
let no_otl_maps=0
let no_otl_insert_maps=0

" overrides:
let otl_bold_headers=0
let otl_use_thlnk=0
"
au BufWinLeave *.otl mkview
au BufWinEnter *.otl silent loadview
let maplocalleader = ","
