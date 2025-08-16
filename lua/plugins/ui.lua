return {
    {
        'rebelot/kanagawa.nvim',
        lazy = false,
        config = function()
            require('kanagawa').setup({
                overrides = function(colors)
                    local theme = colors.theme
                    local makeDiagnosticColor = function(color)
                        local c = require("kanagawa.lib.color")
                        return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex(), italic = true, }
                    end

                    return {
                        DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
                        DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
                        DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
                        DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
                    }
                end
            })
            vim.cmd.colorscheme('kanagawa')
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                component_separators = '',
                section_separators = { left = " ", right = "" },
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                    },
                },
                lualine_b = {
                    {
                        'searchcount',
                        separator = ' ',
                    },
                },
                lualine_c = {
                    {
                        'filetype',
                        colored = true,   -- Displays filetype icon in color if set to true
                        icon_only = true, -- Display only an icon for filetype
                        separator = '',
                        padding = { left = 1, right = 0 },
                    },
                    {
                        'filename',
                        path = 1,
                    },
                    {
                        'diagnostics',
                    }
                },

                lualine_x = {
                    {
                        'location',
                        separator = ' ',
                        padding = { left = 0, right = 0 },
                    },
                    {
                        'progress',
                        separator = ' ',
                        padding = { left = 0, right = 1 },
                    },
                },
                lualine_y = {
                    'encoding',
                },
                lualine_z = {
                    'branch',
                    -- {
                    --     "diff",
                    --     colored = false,
                    --     symbols = {added = " ", modified = " ", removed = " "},
                    -- },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        'filetype',
                        colored = false,   -- Displays filetype icon in color if set to true
                        icon_only = true, -- Display only an icon for filetype
                        separator = '',
                        padding = { left = 1, right = 0 },
                    },
                    {
                        'filename',
                        path = 1,
                    },
                },

                lualine_x = {
                    {
                        'location',
                        separator = ' ',
                        padding = { left = 0, right = 0 },
                    },
                    {
                        'progress',
                        separator = ' ',
                        padding = { left = 0, right = 1 },
                    },
                },
                lualine_y = {
                    'encoding',
                },
                lualine_z = {
                    'branch',
                },
            },

            -- tabline = {
            --     lualine_x = { "lsp_status" },
            -- },
        },
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    }
}
