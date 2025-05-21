-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = "unnamedplus"

vim.opt.spelllang = "en_gb"
vim.opt.spell = true

vim.g.snacks_animate = false
vim.g.lazyvim_eslint_auto_format = false

-- vim.lsp.inlay_hint.enable = false

vim.lsp.set_log_level("off")
