-- https://github.com/MeanderingProgrammer/render-markdown.nvim
return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	ft = { "markdown" },
	opts = {
		render_modes = { "n", "c", "t" },
		heading = {
			enabled = true,
			sign = false,
		},
		code = {
			enabled = true,
			sign = false,
			style = "full",
		},
		bullet = {
			enabled = true,
		},
		checkbox = {
			enabled = true,
		},
		table = {
			enabled = true,
		},
		pipe_table = {
			enabled = true,
		},
	},
}
