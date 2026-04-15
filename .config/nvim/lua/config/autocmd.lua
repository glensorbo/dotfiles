vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set(
				'n',
				keys,
				func,
				{ buffer = event.buf, desc = 'LSP: ' .. desc }
			)
		end

		map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
		map('K', vim.lsp.buf.hover, 'Hover Documentation')
		map('gi', vim.lsp.buf.implementation, 'Go to Implementation')
	end,
})

vim.api.nvim_create_autocmd('BufEnter', {
	group = vim.api.nvim_create_augroup('ColorColumn', { clear = true }),
	desc = 'Change highlighting',
	callback = function()
		vim.api.nvim_set_hl(0, 'SpellBad', { sp = '#0e9ef7', undercurl = true })
	end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
	desc = 'Remove Windows line endings (^M) on save',
	group = vim.api.nvim_create_augroup('FixLineEndings', { clear = true }),
	callback = function()
		local view = vim.fn.winsaveview()
		vim.cmd([[keeppatterns %s/\r//e]])
		vim.fn.winrestview(view)
	end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
	group = vim.api.nvim_create_augroup('FoldImports', { clear = true }),
	pattern = { '*.ts', '*.tsx', '*.js', '*.jsx', '*.mjs' },
	callback = function()
		vim.wo.foldmethod = 'manual'
		vim.cmd('normal! ggV?^import.*$' .. '\r' .. '%zf')
		vim.cmd('nohlsearch')
	end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup(
		'kickstart-highlight-yank',
		{ clear = true }
	),
	callback = function()
		vim.highlight.on_yank()
	end,
})
