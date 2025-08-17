return {
    {
        "folke/which-key.nvim",
        opts = {
            spec = {
                { "<BS>", desc = "Decrement Selection", mode = "x" },
                { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
            },
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    }
    --    {
    --        "ibhagwan/fzf-lua",
    --        dependencies = { "nvim-tree/nvim-web-devicons" },
    --        opts = {}
    --    }
}
