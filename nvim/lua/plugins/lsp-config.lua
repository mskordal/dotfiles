-- This file contains multiple plugins for Language Server Protocol (LSP)
-- configuration
return {
	{ -- this plugin manages LSP servers, linters etc
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{ -- this plugin installs the servers and exposes convenient APIs
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "tsserver", "html", "cssls", "bashls" },
			})
		end,
	},
	{ -- this plugin enables nvim to use the Language Servers
		-- :h vim.lsp.buf -- Display available functions for LSP
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.tsserver.setup({
				capabilities = capabilities
			})
			lspconfig.html.setup({
				capabilities = capabilities
			})
			lspconfig.cssls.setup({
				capabilities = capabilities
			})
			vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
