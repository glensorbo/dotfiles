vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<C-s>", ":%s/")

vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to [P]revious [D]iagnostic message" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to [N]ext [D]iagnostic message" })
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show [D]iagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open [D]iagnostic [Q]uickfix list" })
