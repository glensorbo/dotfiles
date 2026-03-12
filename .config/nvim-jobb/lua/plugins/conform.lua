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
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		-- Override the built-in oxfmt formatter so it also searches for Prettier
		-- config files when resolving the project root (enabling Prettier-compat mode).
		formatters = {
			oxfmt = {
				command = "oxfmt",
				args = { "--stdin-filepath", "$FILENAME" },
				stdin = true,
				cwd = function(self, ctx)
					return require("conform.util").root_file({
						".oxfmtrc.json",
						".oxfmtrc.jsonc",
						".prettierrc",
						".prettierrc.json",
						".prettierrc.yaml",
						".prettierrc.yml",
						".prettierrc.js",
						".prettierrc.cjs",
						"prettier.config.js",
						"prettier.config.cjs",
						"prettier.config.mjs",
						"package.json",
					})(self, ctx)
				end,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			-- oxfmt first, prettier as fallback for all JS ecosystem types
			javascript = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			javascriptreact = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			typescript = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			typescriptreact = { "prettier", "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			json = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			jsonc = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			yaml = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			toml = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			html = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			vue = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			css = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			scss = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			less = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			markdown = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			graphql = { "oxfmt", "prettier", stop_after_first = true, lsp_format = "fallback" },
			cs = { "roslyn", lsp_format = "fallback", stop_after_first = true },
		},
	},
}
