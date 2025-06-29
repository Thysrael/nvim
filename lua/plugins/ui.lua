function get_relative_project_path()
    local current_file = vim.fn.expand('%:p')

    -- 定义各种缓冲区状态符号
    local symbols = {
        modified = '[+]',      -- 文件已修改
        readonly = '[-]',      -- 文件只读或不可修改
        unnamed = '[No Name]', -- 无名缓冲区
        newfile = '[New]',     -- 新创建且未保存的文件
    }

    -- 获取当前缓冲区的状态
    local function get_buffer_status()
        if vim.bo.buftype == 'quickfix' or vim.bo.buftype == 'nofile' then
            return ''  -- 特殊缓冲区不显示状态
        end

        if vim.bo.readonly then
            return symbols.readonly
        elseif vim.bo.modified then
            return symbols.modified
        elseif current_file == '' then
            -- 区分全新文件和未命名缓冲区
            return vim.bo.modifiable and symbols.newfile or symbols.unnamed
        end
        return ''
    end

    local buffer_status = get_buffer_status()

    -- 如果当前没有有效文件路径，只返回状态
    if current_file == '' then
        return buffer_status
    end

    -- 常见项目根目录标记文件/目录
    local root_markers = {
        '.git', '.svn', '.hg',   -- 版本控制目录
        'Makefile', 'CMakeLists.txt', 'package.json', 'pom.xml', -- 构建文件
        '.projectroot', '.root', -- 自定义标记
        'pyproject.toml', 'setup.py', 'requirements.txt' -- Python项目
    }

    local current_dir = vim.fn.fnamemodify(current_file, ':h')
    local root_found = nil

    -- 向上遍历目录树查找标记
    while current_dir ~= '' and current_dir ~= '/' do
        for _, marker in ipairs(root_markers) do
            local marker_path = current_dir .. '/' .. marker
            if vim.fn.filereadable(marker_path) == 1 or vim.fn.isdirectory(marker_path) == 1 then
                root_found = current_dir
                break
            end
        end

        if root_found then break end
        current_dir = vim.fn.fnamemodify(current_dir, ':h')  -- 向上级目录移动
    end

    -- 未找到项目根目录的处理
    if not root_found then
        local result = vim.fn.fnamemodify(current_file, ':t')  -- 返回文件名
        return buffer_status ~= '' and (result .. ' ' .. buffer_status) or result
    end

    -- 确保路径格式一致
    current_file = current_file:gsub('//', '/')
    root_found = root_found:gsub('//', '/')

    -- 提取包含根目录名称的路径
    local root_dir_name = vim.fn.fnamemodify(root_found, ':t')  -- 获取根目录名称
    local relative_in_project = current_file:gsub('^' .. vim.pesc(root_found), '')
    relative_in_project = relative_in_project:gsub('^/', '')  -- 移除开头的斜杠

    -- 如果当前文件就在根目录下
    if relative_in_project == '' then
        return buffer_status ~= '' and (root_dir_name .. ' ' .. buffer_status) or root_dir_name
    end

    -- 拼接根目录名称和项目内相对路径
    local result = root_dir_name .. '/' .. relative_in_project
    return buffer_status ~= '' and (result .. ' ' .. buffer_status) or result
end

return {
    {
        'Mofiqul/dracula.nvim',
        lazy = false,
        config = function()
            vim.cmd.colorscheme("dracula")
        end,
    },
    -- {
    --     'rebelot/kanagawa.nvim',
    --     lazy = false,
    --     config = function()
    --         vim.cmd.colorscheme('kanagawa')
    --     end,
    -- },
    {
        'nvim-tree/nvim-web-devicons',
        opts = {

        },
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            -- options = {
            --     component_separators = '',
            --     section_separators = '',
            -- },
            sections = {
                lualine_a = {
                    {
                        'mode',
                    },
                    -- {
                    --     'searchcount',
                    --     separator = ' ',
                    -- },
                    -- {
                    --     'selectioncount',
                    --     separator = ' ',
                    -- },
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
                    get_relative_project_path,
                    -- 'filename'
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
    }
}
