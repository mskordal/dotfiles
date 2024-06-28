return
{
	"nvim-treesitter/nvim-treesitter",
	build= ":TSUpdate",
	config = function()
		-- configure treesitter
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {"lua", "javascript", "vim", "vimdoc", "html", "css", "markdown", "markdown_inline", "bash"},
			auto_install = true,
			highlight = { enable = true },
		})
	end
}
