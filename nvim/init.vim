" required files under lua/
lua require('init')
lua require('plugins')

" Basics
"set encoding=utf-8
"set showmatch             " show matching brackets and braces
"set autoindent            " indent a new line the same amount as previous
"set wildmode=longest,list " bash-like tab completions
"set guicursor=i:block     " use block as an insert caret
"set visualbell
"set background=dark
"set laststatus=2
"set hlsearch              " highlight research matches
"set relativenumber        " add line numbers relative to current line
"set tabstop=4             " number of columns occupied by a tab
"set shiftwidth=4          " width for autoindents
"set expandtab             " converts tabs to white space
"set cursorline            " highlight current cursorline
"set linebreak
" set cc=80                 " set an 80 column border for style

"filetype plugin on
"syntax on                 " syntax highlighting

"highlight Search ctermfg=White ctermbg=Red
"highlight CursorLine cterm=NONE ctermbg=20
"highlight ExtraWhitespace ctermbg=red guibg=red
":match ExtraWhitespace /\s\+$/ " match trailing whitespaces

" Plugins
" vim-plug is the manager. https://github.com/junegunn/vim-plug
" Use ':PlugInstall' for additions and ':PlugClean' for removals.
"call plug#begin()

"Plug 'https://github.com/vim-airline/vim-airline'

" If nodejs or yarn is not present, run ':call mkdp#util#install()' within
" NeoVim. From https://github.com/iamcco/markdown-preview.nvim/issues/50.
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

"call plug#end()

