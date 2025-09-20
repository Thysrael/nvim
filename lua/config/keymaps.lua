-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', 'esc', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-o>', '<C-w><C-w>', { desc = 'Move focus looply' })
vim.keymap.set('n', '<leader>o', '<C-w><C-w>', { desc = 'Move focus looply' })
vim.keymap.set("n", "<leader>2", ":split<CR>", {desc = "split"})
vim.keymap.set("n", "<leader>3", ":vsplit<CR>", {desc = "vsplit"})

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-right>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-left>', ':vertical resize +2<CR>', opts)

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- move enhancement
vim.keymap.set({'n', 'x'}, 'H', '^', {desc = 'Move to start of line'})
vim.keymap.set({'n', 'x'}, 'L', '$', {desc = 'Move to last non-blank character of line'})
vim.keymap.set('o', 'H', '^', {desc = 'Operator to start of line'})
vim.keymap.set('o', 'L', '$', {desc = 'Operator to end of line (non-blank)'})

vim.keymap.set('i', '<C-f>', '<Right>', {desc = 'Move cursor right (Emacs style)'})
vim.keymap.set('i', '<C-b>', '<Left>', {desc = 'Move cursor left (Emacs style)'})
vim.keymap.set('i', '<C-n>', '<Down>', {desc = 'Move cursor down (Emacs style)'})
vim.keymap.set('i', '<C-p>', '<Up>', {desc = 'Move cursor up (Emacs style)'})
vim.keymap.set('i', '<C-a>', '<Home>', {desc = 'Move to beginning of line (Emacs style)'})
vim.keymap.set('i', '<C-e>', '<End>', {desc = 'Move to end of line (Emacs style)'})
