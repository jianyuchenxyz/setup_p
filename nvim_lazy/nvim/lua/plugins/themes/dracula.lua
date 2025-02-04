return {
    {
        enabled = false,

        "dracula/vim",
        name = "dracula",
        priority = 1000,

        config = function()
            vim.cmd.colorscheme "dracula"
        end
    }
}
