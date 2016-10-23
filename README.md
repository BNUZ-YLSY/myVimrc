#Profile
This file is a configuration for my vim editor, before using it, please install 'Vundle.vim' to your vim editor.

#USAGE

## In Windows
1. Rename the file to '_vimrc'
2. Copy it to "C:/Users/<Your name>"
3. `cd %USERPROFILE%`, then `git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/vimfiles/bundle/Vundle.vim`, then `gvim _vimrc`
4. Install [pathogen.vim](https://github.com/tpope/vim-pathogen)
5. change `rtp` and `call vundle#begin()` to `$USERPROFILE/vimfiles`
6. `:PluginInstall`
7. Done!

## In Linux
1. Rename the file to '.vimrc'
2. Copy it to "~"
3. Open a terminal and set up Vundle: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
4. Install [pathogen.vim](https://github.com/tpope/vim-pathogen)
5. `:PluginInstall`
6. Done!

#KeyMap
- `<F3>` -> switch the *NERDTree* Plugin to on or off.
- `<C-y>` `,` -> Emmet trigger
- `<C-n>` -> Multiple edit
- `<F8>` -> enable markdown preview
- `<F9>` -> disable markdwon preview
