-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>h", Snacks.dashboard.open, { desc = "Open dashboard" })
vim.keymap.set("n", "<Left>", ':echo "No arrows!"<CR>')
vim.keymap.set("n", "<Right>", ':echo "No arrows!"<CR>')
vim.keymap.set("n", "<Up>", ':echo "No arrows!"<CR>')
vim.keymap.set("n", "<Down>", ':echo "No arrows!"<CR>')
vim.keymap.set("v", "<Left>", ':<C-u>echo "No arrows!"<CR>')
vim.keymap.set("v", "<Right>", ':<C-u>echo "No arrows!"<CR>')
vim.keymap.set("v", "<Up>", ':<C-u>echo "No arrows!"<CR>')
vim.keymap.set("v", "<Down>", ':<C-u>echo "No arrows!"<CR>')
vim.keymap.set("i", "<Left>", '<C-o>:echo "No arrows!"<CR>')
vim.keymap.set("i", "<Right>", '<C-o>:echo "No arrows!"<CR>')
vim.keymap.set("i", "<Up>", '<C-o>:echo "No arrows!"<CR>')
vim.keymap.set("i", "<Down>", '<C-o>:echo "No arrows!"<CR>')

vim.keymap.set("n", "vgd", ":vsplit | lua vim.lsp.buf.definition()<CR><C-w>H")
