-- https://github.com/iamcco/markdown-preview.nvim
return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
	ft = { "markdown" },
	build = "cd app && npx --yes yarn install",
	init = function()
		vim.g.mkdp_auto_close = 1
		vim.g.mkdp_theme = "dark"
	end,
	keys = {
		{ "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
	},
}
