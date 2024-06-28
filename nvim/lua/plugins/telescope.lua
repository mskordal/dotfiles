return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                       , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"gbrlsnchs/telescope-lsp-handlers.nvim",
		config = function ()
			require("telescope").setup({
				extensions = {
					lsp_handlers = {
						references = {
							require("telescope.themes").get_dropdown({}),
						},
					},
				},
			})
			require("telescope").load_extension("lsp_handlers")
		end,
	},
}
