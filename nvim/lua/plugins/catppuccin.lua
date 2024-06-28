-- catppuccin
return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			styles = {
				loops = { "italic" },
				comments = {NONE},
			},
			transparent_background = true,
		})
		vim.cmd.colorscheme("catppuccin-macchiato")
	end,
}
