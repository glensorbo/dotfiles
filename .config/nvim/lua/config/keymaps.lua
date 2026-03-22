local map = vim.keymap.set

map('n', '<C-n>', ':Neotree toggle<CR>', {})

map('v', '<C-Up>', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })
map('v', '<C-Down>', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map('i', 'jj', '<Esc>')
map('n', '<C-s>', ':%s/')

map('n', '<leader>a', 'v/\\u<CR>h', { desc = 'Highlight to next capital letter' })

map('n', '<leader>dp', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = 'Go to [P]revious [D]iagnostic message' })

map(
  'n',
  '<leader>co',
  '<cmd>LspTypescriptSourceAction<cr>',
  { desc = 'LSP typescript source action' }
)

map('n', '<leader>dn', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = 'Go to [N]ext [D]iagnostic message' })

map('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show [D]iagnostic [E]rror messages' })
map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic [Q]uickFix list' })

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Buffers
map('n', '<leader>bo', function()
  Snacks.bufdelete.other()
end, { desc = 'Delete Other Buffers' })

map('n', '<S-H>', ':bprevious<cr>', { desc = 'Previous Buffer' })
map('n', '<S-L>', ':bnext<cr>', { desc = 'Next Buffer' })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

map('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename' })

map('n', '<leader>cp', ':CopilotChatToggle<cr>', { desc = 'Open Copilot Chat' })
