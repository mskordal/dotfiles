return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = {left = '|', right = '|'},
				section_separators = {},
			},
			sections = {
				lualine_x ={'encoding', 'filetype'}
			}
		})
	end,
}
