return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    {
      '<leader><leader>',
      function()
        require('fzf-lua').files()
      end,
      desc = 'Find Files in project directory',
    },
    {
      '<leader>fl',
      function()
        require('fzf-lua').live_grep()
      end,
      desc = 'Find by grepping in project directory',
    },
    {
      '<leader>fh',
      function()
        require('fzf-lua').helptags()
      end,
      desc = '[F]ind [H]elp',
    },
    {
      '<leader>fk',
      function()
        require('fzf-lua').keymaps()
      end,
      desc = '[F]ind [K]eymaps',
    },
    {
      '<leader>fB',
      function()
        require('fzf-lua').builtin()
      end,
      desc = '[F]ind FZF [B]uiltin',
    },
    {
      '<leader>fw',
      function()
        require('fzf-lua').grep_cword()
      end,
      desc = '[F]ind current [W]ord',
    },
    {
      '<leader>fW',
      function()
        require('fzf-lua').grep_cWORD()
      end,
      desc = '[F]ind current [W]ORD',
    },
    {
      '<leader>fd',
      function()
        require('fzf-lua').diagnostics_document()
      end,
      desc = '[F]ind [D]iagnostics',
    },
  },
}
