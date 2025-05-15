-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})

vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<C-s>", ":%s/")

vim.keymap.set("n", "<leader>a", "v/\\u<CR>h", { desc = "Highlight to next capital letter" })
