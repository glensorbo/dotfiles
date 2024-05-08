return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		vim.keymap.set("n", "<leader>xx", function()
			require("trouble").toggle()
		end, { desc = "Toggle Trouble" }),
		vim.keymap.set("n", "<leader>xw", function()
			require("trouble").toggle("workspace_diagnostics")
		end, { desc = "Workspace Diagnostics" }),
		vim.keymap.set("n", "<leader>xd", function()
			require("trouble").toggle("document_diagnostics")
		end, { desc = "Document Diagnostics" }),
		vim.keymap.set("n", "<leader>xq", function()
			require("trouble").toggle("quickfix")
		end, { desc = "Toggle Quickfix" }),
		vim.keymap.set("n", "<leader>xl", function()
			require("trouble").toggle("loclist")
		end, { desc = "Toggle Loclist" }),
		vim.keymap.set("n", "gR", function()
			require("trouble").toggle("lsp_references")
		end, { desc = "Toggle LSP Refs" }),
	},
}
