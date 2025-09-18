return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                'lua_ls', 'pyright', 'dockerls', 'terraformls'
            },
            -- automatic_enable = false
        },
        dependencies = {
            {
                "mason-org/mason.nvim",
                config = function()
                    require("mason").setup()
                end
            },
            "neovim/nvim-lspconfig",
            dependencies = { 'saghen/blink.cmp' },
            config = function (_, opts)
                local lspconfig = require('lspconfig')
                for server, config in pairs(opts.servers) do
                    config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                    lspconfig[server].setup(config)
                    if server == "pyright" then
                        server_opts.settings = {
                            python = {
                                pythonPath = vim.fn.getcwd() .. "/.venv/bin/python", -- macOS/Linux
                                -- pythonPath = vim.fn.getcwd() .. "\\.venv\\Scripts\\python.exe", -- Windows
                            },
                        }
                    end
                end
            end
        },
    },
    {
        'saghen/blink.cmp',
        -- dependencies = {
        --  'L3MON4D3/LuaSnip',
        --  version = 'v2.*',
        --  build = "make install_jsregexp",
            dependencies = {
                'rafamadriz/friendly-snippets'
            },
        -- },
        version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'default' },
            -- snippets = { preset = 'luasnip' },
            appearance = {
                nerd_font_variant = 'mono'
            },
            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },
            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            signature = {
                enabled = true,
                border = "rounded",
                max_height = 5,
                max_width = 50,
            },
        },
        opts_extend = { "sources.default" }
    }
}
