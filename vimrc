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
set autoread
let mapleader = ","
set relativenumber
set guioptions-=L
set hidden

highlight ColorColumn ctermbg=gray
set colorcolumn=80

set tabstop=4
set shiftwidth=4
set expandtab
" }}}

" Key Bindings {{{
" CTRL-C to copy (visual mode)
vmap <C-c> y
" " CTRL-X to cut (visual mode)
vmap <C-x> x
" " CTRL-V to paste (insert mode)
imap <C-v> <esc>P
imap jk <esc>
" Shortcut for editing config
command EditConf edit ~/dotvim/vimrc

map <leader>t :CtrlP<CR>
" nmap <Alt-j> <C-W>j
nnoremap Ì <C-W>h
nnoremap Ï <C-W>j
nnoremap È <C-W>k
nnoremap ¬ <C-W>l
" nmap <leader>k <C-W>k
" nmap <A-l> <C-W>l

"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>
nmap ; .

nnoremap <Leader>w :w<CR>

" {{{ Buffers
" Removes buffer and switch to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" Create a new empty buffer
nmap <leader>T :enew<cr>

"Switching buffer
map <leader>n :bn<cr>
map <leader>p :bp<cr>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>
" }}}


" }}}

" Snippets {{{
" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"   
" }}}

" Folds {{{
set foldmethod=marker
set foldenable
set foldlevelstart=0
set foldnestmax=10

" space open/closes folds
nnoremap <space> za
" }}}

" Visual.vim {{{
" Allow maccro repeating on a block
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
" }}}

" {{{ Vim Plug

" Load vim-plug if not exists
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plug')


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
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug '907th/vim-auto-save'
Plug 'jaxbot/browserlink.vim'
Plug 'KabbAmine/vCoolor.vim'
Plug 'ap/vim-css-color'
Plug 'simeji/winresizer'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
" Initialize plugin system
call plug#end()

" }}}

" CtrlP {{{
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" }}}

" Gist-vim {{{
let g:gist_post_private = 1
let g:gist_show_private = 1
" }}}

" AutoSave {{{

set updatetime=1000
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI"]

" }}}

" Vim & Tmux {{{
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" }}}

" Airline {{{
let g:airline_theme='badwolf'
" }}}

" Multicursor {{{
let g:multi_cursor_next_key='<C-m>'

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" }}}

" VimIcons {{{
let g:airline_powerline_fonts = 1

"}}}

" NerdTREE {{{
" let g:nerdtree_tabs_open_on_console_startup=1
" }}}

" VimColors {{{
map ® :VCoolor<CR>
" }}}

" NerdTREE Highlighting {{{
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
"}}}

" Syntax {{{
syntax on
color monokai
" }}}

" Neocomplete {{{
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#min_keyword_length = 3
" }}}

" Snippets {{{

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical"

"let g:auto_save_events = ["InsertLeave", "TextChanged"]
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

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }
noremap <C-w>e :SyntasticCheck<CR>
noremap <C-w>f :SyntasticToggleMode<CR>

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
