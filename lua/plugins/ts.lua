return {
    {
        "nvim-treesitter/nvim-treesitter",
        cond = not vim.g.vscode,
        lazy = false,
        build = ":TSUpdate",
        opts = {
            highlight = { enable = true, additional_vim_regex_highlighting = false, },
            indent = { enable = true },
            sync_install = false,
            ignore_install = { 'org' },
            ensure_installed = {
                "bash",
                "c",
                "diff",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "jsonc",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "printf",
                "python",
                "query",
                "regex",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
                "verilog",
                "latex",
                "make",
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        },
        -- have to pass opts to nvim-treesitter.configs
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
