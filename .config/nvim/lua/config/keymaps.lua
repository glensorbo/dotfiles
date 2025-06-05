-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

map("n", "<C-n>", ":Neotree toggle<CR>", {})

map("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("i", "jj", "<Esc>")
map("n", "<C-s>", ":%s/")

map("n", "<leader>a", "v/\\u<CR>h", { desc = "Highlight to next capital letter" })

map("n", "<leader>dp", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to [P]revious [D]iagnostic message" })
map("n", "<leader>dn", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to [N]ext [D]iagnostic message" })
map("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show [D]iagnostic [E]rror messages" })
map("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open [D]iagnostic [Q]uickFix list" })

map("n", "<leader>Re", function()
  require("kulala").set_selected_env()
end, { desc = "Set enviroment" })

require("mssql").set_keymaps("<leader>m")
