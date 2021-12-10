" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Save to clipboard with cp!
cmap cp! %!xclip -sel clip

"enable last version
set nocompatible

"enable syntax colors
syntax enable

"enable default plugins
filetype plugin on

"set relative line numbers
set relativenumber
set number

"to show highlighted text on visualmode
hi Visual term=reverse cterm=reverse guibg=Grey

"tab spaces
set tabstop=4
set shiftwidth=4
set expandtab

"FINDING FILES

"Search down into subfolders
"Provides tab-completion for all file-related tasks
set path+=**

"Display all matching files when we tab complete
set wildmenu
"Now we can:
"-Hit tab to :find by partial match
"- Use * to make it fuzzy
"
"Things to consider:
"- :b lets you autocomplete any open buffer

" TAG JUMPING

" Create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R
"Now we can:
"- Use C-] to jump ot tag under cursor
"- Use g-C-] for ambiguous tags
"- Use C-t to jump back up the tag stack
"
"Things to consider:
"- This doest't help if you want a visual list of tags

"AUTOCOMPLETE
"documented in |ins-completion|
"
"HIGHLIGHTS:
"- C-x-C-n for just thit file
"- C-x-f for filenames
"- C-x-C-] for tags
"- C-n for everything specified by the 'complete' option
"C-n and C-p for autocomplete back and forth

"FILE BROWSING
"Tweaks for browsing
let g:netrw_banner=0        "disable banner
let g:netrw_browse_split=4  "open in prior window
let g:netrw_altv=1          "open splits to the right
let g:netrw_liststyle=3     "tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
"Now we can:
"- :edit a folder to open a file browser
"- <CR>/v/t to open in an h-split/v-split/tab
"- check |netrw-browse-maps| for more mappings

"NERDTree
"Ctrl+n to toggle
"Ctrl+ww cycle through all windows
"gt go to next tab
":tabn :tabp tab navigation
":tabl last tab
":tabr first tab
":bn :bp :b name - switching between buffers
":ls list buffers
map <C-n> :NERDTreeToggle<CR>

"matchit for xml/html tags
packadd! matchit

"autocomands for specific types
:filetype plugin on

"check for vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"VIM-PLUG
"PlugInstall [name ...] [#threads]   Install plugins
"PlugUpdate [name ...] [#threads]    Install or update plugins
"PlugClean[!]    Remove unlisted plugins (bang version will clean without prompt)
"PlugUpgrade Upgrade vim-plug itself
"PlugStatus  Check the status of plugins
"PlugDiff    Examine changes from the previous update and the pending changes
"PlugSnapshot[!] [output path]   Generate script for restoring the current snapshot of the plugins
call plug#begin('~/.vim/plugged')

"https://github.com/prettier/vim-prettier
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"NerdTree
Plug 'scrooloose/nerdtree'

"git
Plug 'tpope/vim-fugitive'

"encoding
":FencView to change encoding
Plug 'mbbill/fencview'

call plug#end()
