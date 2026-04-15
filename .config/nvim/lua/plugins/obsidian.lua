-- https://github.com/epwalsh/obsidian.nvim
return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/code/personal/docs/personal",
			},
			{
				name = "work",
				path = "~/code/personal/docs/work",
			},
		},
		-- disable built-in UI — render-markdown.nvim handles rendering
		ui = { enable = false },
		completion = {
			nvim_cmp = false,
			blink = true,
		},
	},
	keys = {
		{ "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find note" },
		{ "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New note" },
		{ "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Daily note" },
		{ "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search notes" },
		{ "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks" },
		{ "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "Links" },
	},
}
