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
Plugin 'iamcco/markdown-preview.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'leafgarland/typescript-vim'
Plugin 'ctrlpvim/ctrlp.vim'
" session enhancement
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
" Asynchronous Lint Engine
Plugin 'w0rp/ale'
Plugin 'posva/vim-vue'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/vim-easy-align'
Plugin 'easymotion/vim-easymotion'
" Themes
Plugin 'sjl/badwolf'

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
" let g:solarized_termcolors=256
" colorscheme solarized
"colorscheme desert
" colorscheme gruvbox 
" let g:gruvbox_contrast_dark="hard"
colorscheme badwolf
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
imap jk <Esc>

autocmd FileType c,cpp setlocal cindent shiftwidth=4
autocmd FileType make setlocal noet
autocmd FileType xml,python,groovy,shell,bash,sh,html setlocal sw=4
autocmd FileType groovy setlocal cindent
autocmd FileType yaml,conf,json,javascript,html,vue,markdown setlocal sw=2

" for typescript-vim
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd FileType typescript :setlocal makeprg=tsc " find the tsconfig.json to compile

"自动补全
" :inoremap ( ()<ESC>i
" :inoremap ) <c-r>=ClosePair(')')<CR>
" :inoremap { {}<ESC>i
" :inoremap } <c-r>=ClosePair('}')<CR>
" :inoremap [ []<ESC>i
" :inoremap ] <c-r>=ClosePair(']')<CR>
" :inoremap " ""<ESC>i
" :inoremap ' ''<ESC>i
" function! ClosePair(char)
    " if getline('.')[col('.') - 1] == a:char
            " return "\<Right>"
    " else
            " return a:char
    " endif
" endfunction

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
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_server_python_interpreter = 'c:/Python27/python'

"MarkdownPreview-KeyMapping
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode
let g:mkdp_path_to_chrome = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
let g:mkdp_auto_close = 1
let g:mkdp_auto_open = 1

"copy and paste
vmap <Leader>y "+y
vmap <Leader>p "+p
nmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader>P "+P

" default width and height
" set lines=27 columns=100

" Emmet (C-y ,)
autocmd FileType html,css,vue EmmetInstall

" let the markdown files link normal
let g:vim_markdown_conceal = 0

" vertical split resize
nmap <c-w>[ :vertical resize -5<CR>
nmap <c-w>] :vertical resize +5<CR>

" improve performance
set lazyredraw

" airline realted
" let g:airline_theme="wombat"
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set encoding=utf-8
set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1

" makes the % command work better
packadd matchit

" ALE setting
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'javascript': ['standard'],
\   'typescript': ['tslint']
\}

" Python common commenet 
function HeaderPython()
    call setline(1, "# !/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()


if has('win32')
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set encoding=utf-8
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
    set fileencoding=utf-8 " 新建文件使用的编码

    " 解决菜单乱码
    set langmenu=zh_CN
    let $LANG = 'zh_CN.UTF-8'
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    " Disable the alt/meta (<M-*>) mapping on the Windows menu.
    set winaltkeys=no
endif

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Auto-paris fly mode
let g:AutoPairsFlyMode = 0

" Easy search the select content
vnoremap // y/<c-r>"<cr>

" CTRLP ignore
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules'
  \ }

map <f3> :NERDTreeToggle<CR>
" Comment with one Space
let g:NERDSpaceDelims=1
" Ignore *.pyc
let NERDTreeIgnore = ['\.pyc$']
" NERDCommenter for vue settings
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction
let g:vue_disable_pre_processors=1


" Vim general
set nofoldenable

" ==================== Easy Motion ====================
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap <space> <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <space>s <Plug>(easymotion-overwin-f2)

" <space>f{char} to move to {char}
map  <space>f <Plug>(easymotion-bd-f)
nmap <space>f <Plug>(easymotion-overwin-f)

" Move to line
map <space>L <Plug>(easymotion-bd-jk)
nmap <space>L <Plug>(easymotion-overwin-line)

" Move to word
map  <space>w <Plug>(easymotion-bd-w)
nmap <space>w <Plug>(easymotion-overwin-w)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
" ==================== Easy Motion ====================
