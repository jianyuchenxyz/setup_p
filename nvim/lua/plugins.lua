-- https://github.com/junegunn/vim-plug?tab=readme-ov-file#example-lua-configuration-for-neovim
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('https://github.com/vim-airline/vim-airline')
Plug("iamcco/markdown-preview.nvim", { ["do"] = vim.fn["mkdp#util#install"], ["for"] = { "markdown", "vim-plug" } })

vim.call('plug#end')

