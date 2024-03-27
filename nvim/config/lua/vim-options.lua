vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.smartindent = true

vim.opt.mouse = "a"

vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = "split"

vim.opt.cursorline = true

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
