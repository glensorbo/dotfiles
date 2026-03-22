-- https://github.com/stevearc/conform.nvim
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      javascriptreact = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      typescript = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      typescriptreact = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      json = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      jsonc = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      yaml = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      toml = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      html = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      vue = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      css = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      scss = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      less = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      markdown = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      graphql = { 'oxfmt', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
      cs = { 'roslyn', lsp_format = 'fallback', stop_after_first = true },
    },
  },
}
