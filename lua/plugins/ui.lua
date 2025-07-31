return {
    -- {
    --     'Mofiqul/dracula.nvim',
    --     lazy = false,
    --     config = function()
    --         vim.cmd.colorscheme("dracula")
    --     end,
    -- },
    {
        'rebelot/kanagawa.nvim',
        lazy = false,
        config = function()
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
        },
    },
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            image = {
                enabled = true,
                doc = {
                    enabled = true,
                    inline = true,
                    float = true,
                    max_width = 80,
                    max_height = 40,
                    conceal = function(lang, type)
                        return false
                    end,
                },

                math = {
                    enabled = true, -- enable math expression rendering
                    latex = {
                        font_size = "normalsize",
                    },
                },

            },
        },
    },
}
