-- Basic Options
vim.opt.number = true         -- Show line numbers
-- vim.opt.relativenumber = true -- Relative line numbers for jumping
vim.opt.shiftwidth = 4        -- Size of an indent
vim.opt.tabstop = 4           -- Number of spaces tabs count for
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.smartindent = true    -- Insert indents automatically
vim.opt.ignorecase = true     -- Ignore case in search patterns
vim.opt.smartcase = true      -- Override ignorecase if search has capitals
vim.opt.termguicolors = true  -- Enable 24-bit RGB colors

-- Set Leader Key
vim.g.mapleader = " "

-- Quick Keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Open file explorer

