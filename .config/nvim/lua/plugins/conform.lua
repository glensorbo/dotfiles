-- https://github.com/stevearc/conform.nvim
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true }, function()
					vim.cmd("write")
				end)
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		format_on_save = {
			timeout_ms = 750,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = {
				"prettierd",
				"prettier",
				lsp_format = "fallback",
				stop_after_first = true,
			},
			typescript = {
				"prettierd",
				"prettier",
				lsp_format = "fallback",
				stop_after_first = true,
			},
			typescriptreact = {
				"prettierd",
				"prettier",
				lsp_format = "fallback",
				stop_after_first = true,
			},
			json = {
				"prettierd",
				"prettier",
				lsp_format = "fallback",
				stop_after_first = true,
			},
			css = {
				"prettierd",
				"prettier",
				lsp_format = "fallback",
				stop_after_first = true,
			},
			cs = {
				"roslyn",
				lsp_format = "fallback",
				stop_after_first = true,
			},
			markdown = {
				"prettierd",
				"prettier",
				lsp_format = "fallback",
				stop_after_first = true,
			},
		},
	},
}
