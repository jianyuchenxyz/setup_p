return {
    enabled = true,

    "nvim-tree/nvim-tree.lua",
    name = "nvim-tree",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("nvim-tree").setup{}
    end
}
