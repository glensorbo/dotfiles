return {
	"imNel/monorepo.nvim",
	config = function()
		require("monorepo").setup({
			silent = false, -- Supresses vim.notify messages
			autoload_telescope = true, -- Automatically loads the telescope extension at setup
			data_path = vim.fn.stdpath("data"), -- Path that monorepo.json gets saved to

			vim.keymap.set("n", "<leader>mrt", ":Telescope monorepo<CR>", { desc = "[M]ono[R]epo" }),
			vim.keymap.set("n", "<leader>mra", function()
				require("monorepo").toggle_project()
			end, { desc = "[M]ono[Repo][A]dd" }),
			vim.keymap.set("n", "<leader>mrr", function()
				require("monorepo").toggle_project()
			end, { desc = "[M]ono[Repo][R]emove" }),
		})
	end,
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
}
