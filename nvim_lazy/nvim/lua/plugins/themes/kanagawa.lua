return {
    {
        enabled = false,

        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        priority = 1000,

        config = function()
            -- available: "dragon", "lotus", "wave"
            vim.cmd.colorscheme "kanagawa-wave"
        end
    }
}
