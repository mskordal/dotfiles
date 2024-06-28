vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")

vim.g.mapleader= " " -- set <leader> key to <Space>
vim.g.have_nerd_font = true

vim.opt.colorcolumn = "80"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "| " }

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the down window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the up window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('v', '<leader>e(', 'di(<Esc>pa)<Esc>', {})
