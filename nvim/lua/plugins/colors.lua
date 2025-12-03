return{
    -- Colorschemes
    -- {
    --  "folke/tokyonight.nvim",
    --  lazy = false,
    --  priority = 1000,
    --  opts = {},
    --  config = function()
    --      ---@diagnostic disable-next-line: missing-fields
    --      require('tokyonight').setup {
    --          styles = {
    --              comments = { italic = false }, -- Disable italics in comments
    --          },
    --      }
    --
    --      -- Load the colorscheme here.
    --      -- Like many other themes, this one has different styles, and you could load
    --      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    --      vim.cmd.colorscheme 'tokyonight-night'
    --  end,
    -- },
    {
     'maxmx03/dracula.nvim',
     lazy = false,
     priority = 1000,
     opts = {},
     config = function()
         ---@diagnostic disable-next-line: missing-fields
         require('dracula').setup {
         }

         -- Load the colorscheme here.
         -- Like many other themes, this one has different styles, and you could load
         -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
         vim.cmd.colorscheme 'dracula'
     end,
    },
    -- {
    --     "loctvl842/monokai-pro.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         ---@diagnostic disable-next-line: missing-fields
    --         require('monokai-pro').setup {
    --             transparent_background = true,
    --         --  styles = {
    --         --      comments = { italic = false }, -- Disable italics in comments
    --         --  },
    --         }
    --
    --         -- Load the colorscheme here.
    --         -- Like many other themes, this one has different styles, and you could load
    --         -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    --         vim.cmd.colorscheme 'monokai-pro'
    --     end,
    -- },
    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                sections = {
                    lualine_c = { {'filename', path = 1} }
                },
                inactive_sections = {
                    lualine_c = { {'filename', path = 1} }
                }
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        },
        config = function ()
            require('todo-comments').setup()
            vim.keymap.set("n", "<leader>td", "<cmd>TodoQuickFix<cr>", { desc = "Show TODO list" })
        end
    }
}
