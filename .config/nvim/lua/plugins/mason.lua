-- https://github.com/mason-org/mason-lspconfig.nvim/tree/main#configuration
return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
	---@class MasonLspconfigSettings
	opts = {
		automatic_enable = true,
		ensure_installed = {
			"ts_ls",
			"lua_ls",
			"oxlint",
			"stylua",
			"marksman",
		},
	},
}
