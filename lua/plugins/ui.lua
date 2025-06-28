return {
    {
        'Mofiqul/dracula.nvim',
        lazy = false,
        config = function()
    	    vim.cmd.colorscheme("dracula")
    	end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                component_separators = '',
                section_separators = '',
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},

                lualine_x = {
                    {
                        'filetype',
                        colored = true,   -- Displays filetype icon in color if set to true
                        icon_only = false, -- Display only an icon for filetype
                    },
                },
                lualine_y = { 'progress' },
                lualine_z = { 'encoding' },
            },
        },
    },
}
