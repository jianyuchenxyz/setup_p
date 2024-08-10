-- Referenced from github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/options.lua
-- https://gist.github.com/lalitmee/c379ee6b5163ac3670cfbca9a356b6bb
-- Apparently requires NeoVim v0.7+ to work with Lua!?

local g = vim.g     -- global vars
local opt = vim.opt -- set options (global/buffer/window)

opt.fileencoding = 'utf-8'
opt.encoding = 'utf-8'
-- opt.mouse = 'a'               -- enable mouse support
-- opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.background = 'dark'       -- set background color. TODO: not needed?
opt.guicursor = ''            -- block cursor
opt.laststatus = 3            -- global status line
opt.swapfile = false          -- don't use swapfile
opt.number = true             -- show line numbers
opt.relativenumber = true     -- show relative line numbers
opt.showmatch = true          -- highlight matching parenthesis
opt.expandtab = true          -- use spaces instead of tabs
opt.shiftwidth = 4            -- shift 4 spaces when using tab
opt.tabstop = 4               -- 1 tab is equivalent to 4 spaces
opt.smartindent = true        -- autoindent new lines
opt.cursorline = true         -- highlight current line
opt.history = 100             -- keep N lines of history
opt.lazyredraw = true         -- faster scrolling
opt.belloff = 'all'

-- opt.colorcolumn = '80'        -- set color boundary at column position
-- opt.termguicolors = true      -- enable 24-bit RGB colors

-- Autocomplete options
opt.completeopt = 'menuone,noinsert,noselect'

vim.cmd [[highlight Search ctermbg=red ctermfg=white]]
vim.cmd [[highlight CursorLine cterm=NONE ctermbg=20]]
vim.cmd [[highlight ExtraWhitespace ctermbg=red guibg=red]]
vim.cmd [[match ExtraWhitespace /\s\+$/]]

