-- https://github.com/mason-org/mason-lspconfig.nvim/tree/main#configuration
local git_blame = require("gitblame")

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = false,
			-- theme = 'auto',
			theme = "codedark",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "neo-tree" },
			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = {
				{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
				"encoding",
				"filetype",
			},
			lualine_y = {
				"lsp_status",
				{
					"vim.g.roslyn_nvim_selected_solution:gsub('^.*/', '')",
					cond = function()
						return vim.bo.filetype == "cs"
					end,
				},
			},
			lualine_z = { "progress", "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}
