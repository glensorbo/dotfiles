-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"markdown",
			"markdown_inline",
			"javascript",
			"typescript",
			"tsx",
			"c_sharp",
			"json",
			"yaml",
			"toml",
			"http",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter").setup(opts)
		vim.filetype.add({
			extension = {
				http = "http",
				rest = "http",
			},
		})
	end,
}
