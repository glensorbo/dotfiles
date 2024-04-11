return {
	"sindrets/diffview.nvim",
	config = function()
		vim.keymap.set("n", "<leader>gdo", ":DiffviewOpen<CR>", { desc = "[G]it [D]iff [O]pen" })
		vim.keymap.set("n", "<leader>gdc", ":DiffviewClose<CR>", { desc = "[G]it [D]iff [C]lose" })
	end,
}
