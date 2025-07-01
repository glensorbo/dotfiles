-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = "unnamedplus"

vim.opt.spelllang = "en_gb"
vim.opt.spell = true

vim.g.snacks_animate = false
vim.g.lazyvim_eslint_auto_format = false

-- vim.lsp.inlay_hint.enable = false

vim.lsp.set_log_level("off")

vim.lsp.config("roslyn", {
  settings = {
    ["csharp|background_analysis"] = {
      dotnet_compiler_diagnostics_scope = "fullSolution",
      dotnet_analyzer_diagnostics_scope = "fullSolution",
    },
    ["csharp|code_lens"] = {
      dotnet_enable_references_code_lens = true,
      dotnet_enable_tests_code_lens = true,
    },
    ["csharp|inlay_hints"] = {
      csharp_enable_inlay_hints_for_implicit_object_creation = false,
      csharp_enable_inlay_hints_for_implicit_variable_types = false,
      csharp_enable_inlay_hints_for_lambda_parameter_types = false,
      csharp_enable_inlay_hints_for_types = false,
      dotnet_enable_inlay_hints_for_indexer_parameters = false,
      dotnet_enable_inlay_hints_for_literal_parameters = false,
      dotnet_enable_inlay_hints_for_object_creation_parameters = false,
      dotnet_enable_inlay_hints_for_other_parameters = false,
      dotnet_enable_inlay_hints_for_parameters = false,
      dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = false,
      dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = false,
      dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = false,
    },
    ["csharp|completion"] = {
      dotnet_show_completion_items_from_unimported_namespaces = true,
    },
    ["csharp|formatting"] = {
      dotnet_enable_formatting = true,
      dotnet_format_on_type = true,
      dotnet_format_on_save = true,
      dotnet_format_on_save_timeout_ms = 1000,
      dotnet_format_on_save_require_confirmation = false,
    },
  },
})
