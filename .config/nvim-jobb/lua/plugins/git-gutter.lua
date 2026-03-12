-- https://github.com/airblade/vim-gitgutter
return {
	"airblade/vim-gitgutter",
	init = function()
		-- vim.g.gitgutter_map_keys = 0 -- Don't create keybinds
		vim.g.gitgutter_preview_win_floating = 1
		-- vim.g.gitgutter_set_sign_backgrounds = 1

		-- vim.g.gitgutter_sign_added = "󰐗"
		-- vim.g.gitgutter_sign_modified = ""
		-- vim.g.gitgutter_sign_removed = "󰍶"
		-- vim.g.gitgutter_sign_modified_removed = "󰍶"

		vim.g.gitgutter_sign_added = "┃"
		vim.g.gitgutter_sign_modified = "┇"
		vim.g.gitgutter_sign_removed = "━"
		vim.g.gitgutter_sign_modified_removed = "┇"
	end,
	config = function()
		vim.api.nvim_set_hl(0, "GitGutterAdd", { fg = "#479829" }) -- , bg = "#003c00" })
		vim.api.nvim_set_hl(0, "GitGutterChange", { fg = "#ae7d00" }) -- , bg = "#4e3200" })
		vim.api.nvim_set_hl(0, "GitGutterDelete", { fg = "#df5950" })
		vim.api.nvim_set_hl(0, "GitGutterUpdateDelete", { fg = "#ae7d00" })
	end,
}
