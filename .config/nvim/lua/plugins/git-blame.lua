-- https://github.com/f-person/git-blame.nvim#configuration
return {
	"f-person/git-blame.nvim",
	-- load the plugin at startup
	event = "VeryLazy",
	-- Because of the keys part, you will be lazy loading this plugin.
	-- The plugin will only load once one of the keys is used.
	-- If you want to load the plugin at startup, add something like event = "VeryLazy",
	-- or lazy = false. One of both options will work.
	opts = {
		enabled = true,
		display_virtual_text = false,
		message_template = "<author> • <date> • <sha>",
		date_format = "%r",
		-- virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
	},
}
