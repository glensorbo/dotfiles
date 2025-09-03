return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	lazy = true,
	opts = {
		history = true,
		delete_check_events = "TextChanged",
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
	end,
	keys = function()
		local ls = require("luasnip")
		local tabKey = vim.api.nvim_replace_termcodes("<Tab>", true, false, true)

		return {
			{
				"<Tab>",
				function()
					if ls.expand_or_jumpable() then
						ls.expand_or_jump()
					else
						vim.api.nvim_feedkeys(tabKey, "n", false)
					end
				end,
				desc = "Jump to next snippet section",
				mode = { "i" },
			},
			{
				"<Tab>",
				function()
					if ls.expand_or_jumpable() then
						ls.jump(1)
					else
						vim.api.nvim_feedkeys(tabKey, "n", false)
					end
				end,
				desc = "Jump to next snippet section",
				mode = { "i", "s" },
			},
			{
				"<S-Tab>",
				function()
					ls.jump(-1)
				end,
				desc = "Jump to previous snippet section",
				mode = { "i", "s" },
			},
		}
	end,
}
