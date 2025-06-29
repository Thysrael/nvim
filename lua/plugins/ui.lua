function get_relative_project_path()
    local current_file = vim.fn.expand('%:p')
    if current_file == '' then return '' end

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
        return vim.fn.fnamemodify(current_file, ':t')  -- 返回文件名
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
        return root_dir_name
    end

    -- 拼接根目录名称和项目内相对路径
    return root_dir_name .. '/' .. relative_in_project
end

return {
    -- {
    --     'Mofiqul/dracula.nvim',
    --     lazy = false,
    --     config = function()
    -- 	    vim.cmd.colorscheme("dracula")
    -- 	end,
    -- },
    {
        'rebelot/kanagawa.nvim',
        lazy = false,
        config = function()
            vim.cmd.colorscheme('kanagawa')
        end,
    },
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
                    -- get_relative_project_path,
                    'filename'
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
}
