return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                'c', 'python', 'lua', 'vim', 'vimdoc', 'query', 'elixir', 'heex', 'javascript',
                'html', 'dockerfile', 'hcl', 'markdown', 'markdown_inline', 'bash', 'yaml'
            },
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            indent = { enable = true },
        })

        -- Markdown conceal fix
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function()
                vim.opt_local.conceallevel = 0
            end,
        })

        -- FileType-specific indentation
        -- vim.api.nvim_create_autocmd("FileType", {
        --  pattern = { "terraform", "hcl" },
        --  callback = function()
        --      vim.opt_local.shiftwidth = 4
        --      vim.opt_local.tabstop = 4
        --      vim.opt_local.softtabstop = 4
        --      vim.opt_local.expandtab = false
        --  end,
        -- })
    end
}
