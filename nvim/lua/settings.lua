vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.wildmenu = true
vim.opt.wildmode = { 'list', 'longest' }
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.g.python_recommended_style = 0
vim.o.scrolloff = 10

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.breakindent = true
vim.opt.undofile = true
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 1300
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.confirm = true
vim.opt.colorcolumn = "100"
vim.opt.textwidth = 100 -- A positive num here makes nvim break lines when threshold is reached
vim.opt.formatoptions:remove("t")

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Mappings
-- Toggle diagnostics. Requires lspconfig
vim.keymap.set(
	"n", "<leader>d", vim.diagnostic.open_float,
	{ desc = "Show LSP diagnostic message" }
)
-- Allow dockerfiles named other than "dockerfile" to get the correct syntax
vim.api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{
		pattern = {
			"Dockerfile", "Dockerfile.*",
			"dockerfile", "dockerfile.*"
		},
		callback = function()
			vim.bo.filetype = "dockerfile"
		end,
	}
)
-- open file in the same position it was last closed
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = {"*"},
	callback = function()
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.api.nvim_exec("normal! g'\"",false)
		end
	end
})
