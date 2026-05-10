--
-- Basic keymaps
--
vim.keymap.set("n", "<leader>w", ":w<CR>", {desc = "write"})
vim.keymap.set("n", "<leader>q", ":q<CR>", {desc = "quit"})

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus, {desc = "Focus NvimTree"})

