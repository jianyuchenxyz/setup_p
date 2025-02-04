return {
    enabled = true,

    "nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "bash",
                "css",
                "diff",
                "dockerfile",
                "go",
                "gomod",
                "gosum",
                "gotmpl",
                "html",
                "javascript",
                "json",
                "lua",
                "luadoc",
                "make",
                "markdown_inline",
                "nix",
                "toml",
                "vim",
                "vimdoc",
                "vimdoc",
                "xml",
                "yaml",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
