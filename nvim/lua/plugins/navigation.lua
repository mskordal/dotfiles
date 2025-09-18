return {
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
            "TmuxNavigatorProcessList",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        lazy = false, -- neo-tree will lazily load itself
        ---@module "neo-tree"
        ---@type neotree.Config?
        config = function ()
            require('neo-tree').setup({

                window = {
                    mappings = {
                        ["s"] = {"open_split"},
                        ["v"] = {"open_vsplit"},
                    }
                }
            })
            vim.keymap.set("n", "<leader>nt", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })
        end
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        opts = {
        },
        keys = {
            {
                '<leader>ff',
                function() require('fzf-lua').files() end,
                desc = 'Fuzzy finder for files'
            },
            {
                '<leader>fg',
                function() require('fzf-lua').live_grep() end,
                desc = 'Fuzzy finder for files'
            },
        },
        config = function ()
            require('fzf-lua').setup({
                files = {
                    hidden = true,
                    fd_opts = "--color=never --hidden --no-ignore --type f --type l --ignore-file ~/.config/nvim/lua/plugins/fdignore",
                    -- rg_opts = "--hidden --no-ignore --glob '!*/venv*/*'"
                }
            })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    }
}
