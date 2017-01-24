" My Personal Vim config file
" Maintainer:	AFONSO Benjamin <hello@benjaminafonso.me>
" Last change:	2017 Jan 8
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc





" Global configs {{{
set nocompatible
filetype off

let mapleader = ","
set relativenumber
" }}}

" Key Bindings {{{
" CTRL-C to copy (visual mode)
vmap <C-c> y
" " CTRL-X to cut (visual mode)
vmap <C-x> x
" " CTRL-V to paste (insert mode)
imap <C-v> <esc>P

" Shortcut for editing config
command EditConf edit ~/dotvim/vimrc
 " }}}

" Snippets {{{

" }}}

" Folds {{{
set foldmethod=marker
set foldenable
set foldlevelstart=0
set foldnestmax=10

" space open/closes folds
nnoremap <space> za
" }}}

 " Plug {{{

" Load vim-plug if not exists
if empty(glob("~/dotvim/autoload/plug.vim"))
    execute '!curl -fLo ~/dotvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/dotvim/plug')


Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'sickill/vim-monokai'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-fugitive'
" Initialize plugin system
call plug#end()


" }}}

" Syntax {{{
syntax on
color monokai
" }}}

" NERDTree {{{
:map <silent> <C-n> :NERDTreeToggle<CR>		" Ctrl-n to Toggle the Tree View
" }}}

" Airline {{{
let g:airline#extensions#tabline#enabled = 1
:set laststatus=2 	" Fix airline when not in split mode
" }}}

" Syntastic settings {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" IdentGuides setting {{{s
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" }}}

" Backup files {{{
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Disable backup files xxx.xx~
set nobackup
set nowritebackup
set noundofile

" }}}

" History & Ruler {{{
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set nu			" Show line numbers
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
" }}}

" Mouse {{{
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif
" }}}

" Syntax Highlighting {{{

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif
" }}}

" AutoIndent {{{
" Only do this part when compiled with support for autocommands.

if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all textfiles set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
    augroup END
else
    set autoindent		" always set autoindenting on
-endif " has("autocmd")


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
" }}}

" Tagbar {{{

nmap <F2> :TagbarToggle<CR>

" }}}

" Langage no remmaping {{{
if has('langmap') && exists('+langnoremap')
    " Prevent that the langmap option applies to characters that result from a
    " mapping.  If unset (default), this may break plugins (but it's backward
    " compatible).
    set langnoremap
endif
" }}}
