return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },

        -- example using `opts` for defining servers
        opts = {
            servers = {
                lua_ls = {}
            }
        },
       -- example calling setup directly for each LSP
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = require('lspconfig')

            lspconfig['lua_ls'].setup({ capabilities = capabilities })

            vim.diagnostic.config({
                underline = false,
                signs = false,
                update_in_insert = false,
                virtual_text = { spacing = 2, prefix = "●" },
                severity_sort = true,
                float = { border = "rounded", },
            })
        end
    }
}
