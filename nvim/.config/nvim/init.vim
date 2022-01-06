set number " adds the number ruler at the left
set relativenumber " changes the ruler at the left to show relative numbers
set autoindent " applies the indentation of the current line to the next
set expandtab " causes spaces to be used in place of tab characters
set tabstop=2 " specifies the width of a tab character
set softtabstop=2 " fine tunes the amount of white space to be inserted, meaning we can use tabs to indent and backspace to delete the whole tab
set shiftwidth=2 " determines the amount of white space to insert or remove using the indentation commands in normal mode
set smarttab " determines the amount of white spaces to be inserted depending on where the cursor is
set mouse=a " allows yo to use the mouse
set scrolloff=8 " makes the scroll happen 8 lines before reaching the top or bottom of the screen
set signcolumn=yes " adds an extra column right before the number column to highlight meta information


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Initialize plugin system
call plug#end()

let g:vim_jsx_pretty_colorful_config = 1 " default 0
