return {
    {
        enabled = true,

        "lukas-reineke/indent-blankline.nvim",
        name = "indent-blankline",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config

        config = function()
            require("ibl").setup{
                indent = { char = "▏" },
                scope = { enabled = false },
            }
        end
    }
}
