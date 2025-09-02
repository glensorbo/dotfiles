-- https://github.com/akinsho/bufferline.nvim#configuration
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
      middle_mouse_command = "bdelete! %d",
      -- right_mouse_command = "BufferLineCloseOthers",
      right_mouse_command = "vertical sbuffer %d",
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "BufferLineFill",
          text_align = "left",
          separator = false,
        },
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
    },
  },
}

