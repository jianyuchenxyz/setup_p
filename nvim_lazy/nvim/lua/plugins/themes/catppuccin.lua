return {
    {
        enabled = true,

        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        config = function()
            -- available: frappe, latte, macchiato, mocha
            vim.cmd.colorscheme "catppuccin-mocha"
        end
    }
}
