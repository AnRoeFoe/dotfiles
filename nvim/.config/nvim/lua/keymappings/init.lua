--
-- Basic keymaps
--
vim.keymap.set("n", "<leader>w", ":w<CR>", {desc = "save"})
vim.keymap.set("n", "<leader>q", ":q<CR>", {desc = "quit"})

vim.keymap.set("n", "<leader>ex", vim.cmd.NvimTreeFocus, {desc = "Focus NvimTree"})

