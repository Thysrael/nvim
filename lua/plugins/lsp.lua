return {
    {
        "mason-org/mason.nvim",
        cond = not vim.g.vscode,
        opts = {}
    },
    {
        'neovim/nvim-lspconfig',
        cond = not vim.g.vscode,
        dependencies = { 'saghen/blink.cmp' },

        -- example using `opts` for defining servers
        opts = {
            servers = {
                lua_ls = {},
                pyright = {},
            }
        },
        -- example calling setup directly for each LSP
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            -- give the lua_ls the capabilities of blink.cmp
            vim.lsp.enable('lua_ls', { capabilities=capabilities })

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
