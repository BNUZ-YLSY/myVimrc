"set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize

" Linux
"set rtp+=~/.vim/bundle/Vundle.vim/
"call vundle#begin('~/.vim/bundle/')
" Windows
set rtp+=$USERPROFILE/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'

"Vundle管理的插件
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdcommenter'
"markdown语法高亮
Plugin 'plasticboy/vim-markdown'
"Plugin 'iamcco/markdown-preview.vim'
Plugin 'bling/vim-airline'
"snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'leafgarland/typescript-vim'


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

"-----------------------------------------------------------------------------------

" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

"Here is for my personal settings

execute pathogen#infect()
syntax on
" filetype plugin indent on

" theme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
"colorscheme desert
set guifont=Source_Code_Pro:h13

set hls
set nu
set tabstop=8
set shiftwidth=8
set softtabstop=8
set smarttab
set smartindent
set expandtab
"突出显示当前行
set cursorline
"开启状态栏
set laststatus=2
"显示输入的命令
set showcmd
"在状态栏显示当前光标位置
set ruler
"命令模式下按tab列出补全的命令
set wildmenu

vmap <C-c> "+y
map <f3> :NERDTreeToggle<CR>
imap jk <Esc>

autocmd FileType c,cpp setlocal cindent shiftwidth=4
autocmd FileType make setlocal noet
autocmd FileType xml,python,groovy,javascript setlocal sw=4
autocmd FileType groovy setlocal cindent
autocmd FileType shell,yaml,conf,json setlocal sw=2

" for typescript-vim
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd FileType typescript :setlocal makeprg=tsc " find the tsconfig.json to compile

"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
    else
            return a:char
    endif
endfunction

"markdown-setting: YAML
let g:vim_markdown_frontmatter=1

"YCM_Settings
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:syntastic_cpp_compiler='g++' "change the compiler to 'g++' to support c++11
let g:syntastic_cpp_compiler_options='-std=c++11 -stdlib=libc++'  "set the options of g++ to support c++11
" YCM with TypeScript
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

"MarkdownPreview-KeyMapping
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode


"copy and paste
vmap <Leader>y "+y
vmap <Leader>p "+p
nmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader>P "+P

" default width and height
set lines=27 columns=100

" Emmet (C-y ,)
autocmd filetype html,css EmmetInstall

" let the markdown files link normal
let g:vim_markdown_conceal = 0

" Comment with one Space
let g:NERDSpaceDelims=1

" vertical split resize
nmap <c-w>[ :vertical resize -5<CR>
nmap <c-w>] :vertical resize +5<CR>

" improve performance
set lazyredraw
