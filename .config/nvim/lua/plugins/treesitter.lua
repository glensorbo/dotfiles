-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		vim.filetype.add({
			extension = {
				["http"] = "http",
			},
		})
		vim.filetype.add({
			extension = {
				["rest"] = "http",
			},
		})
		require("nvim-treesitter").install({
			"lua",
			"typescript",
			"javascript",
			"css",
			"html",
			"http",
			"latex",
			"markdown_inline",
			"markdown",
			"norg",
			"scss",
			"svelte",
			"tsx",
			"typst",
			"vue",
		})
	end,
}
