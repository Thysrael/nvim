return {
    {
        'akinsho/toggleterm.nvim',
        cond = not vim.g.vscode,
        version = "*",
        opts = {
            direction = 'float',
            open_mapping = [[<C-t>]],
        },
    }
}
