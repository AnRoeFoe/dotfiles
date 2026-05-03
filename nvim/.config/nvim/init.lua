-- Basic settings
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.tabstop = 2 -- tab width
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.termguicolors = true -- better colors

-- Leader key
vim.g.mapleader = " "

-- Basic keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>") -- save
vim.keymap.set("n", "<leader>q", ":q<CR>") -- quit

-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
{"nvim-tree/nvim-tree.lua"},
{"nvim-lualine/lualine.nvim"}, {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
}, {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {'nvim-lua/plenary.nvim'}
}, {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate'
}})

-- Setup plugins
require("nvim-tree").setup()
require("lualine").setup()
require("catppuccin").setup()

vim.cmd.colorscheme "catppuccin"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {
    desc = 'Telescope find files'
})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
    desc = 'Telescope live grep'
})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {
    desc = 'Telescope buffers'
})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
    desc = 'Telescope help tags'
})

