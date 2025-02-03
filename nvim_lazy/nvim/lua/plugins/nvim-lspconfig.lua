return {
	{
        enabled = true,

        "neovim/nvim-lspconfig",
        config = function()
            require"lspconfig".gopls.setup({
                settings = {
                    gopls = {
                        staticcheck = true,
                    },
                },
            })
        end
    }
}
