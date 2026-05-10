
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        --
        -- Fuzzy Finder
        --
        {
            "https://github.com/junegunn/fzf.vim",
            dependencies = {
                "https://github.com/junegunn/fzf",
            },
            keys = {
                { "<Leader><Leader>", "<Cmd>Files<CR>", desc = "Find files" },
                { "<Leader>,", "<Cmd>Buffers<CR>", desc = "Find buffers" },
                { "<Leader>/", "<Cmd>Rg<CR>", desc = "Search project" },
            },
        },
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
            keys = {
                {
                    "<leader>s",
                    function()
                        require("which-key").show({ global = false })
                    end,
                    desc = "Buffer Local Keymaps (which-key)",
                },
            },
        },
        --
        -- File manager
        --
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("nvim-tree").setup {}
            end,
        },
        {
            "https://github.com/windwp/nvim-autopairs",
            event = "InsertEnter", -- Only load when you enter Insert mode
            config = function()
                require("nvim-autopairs").setup()
            end,
        },
        {
            "https://github.com/numToStr/Comment.nvim",
            event = "VeryLazy", -- Special lazy.nvim event for things that can load later and are not important for the initial UI
            config = function()
                require("Comment").setup()
            end,
        },
        {"nvim-lualine/lualine.nvim"},
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
        {
            'nvim-treesitter/nvim-treesitter',
            lazy = false,
            build = ':TSUpdate'
        }
    }
)

require("lualine").setup()

