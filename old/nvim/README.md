# Neovim

## Install

Run the install script in this folder. Neovim v0.9.5 or later required. The install script checks if requirements are met, and gets the latest version if Neovim isn't installed.

```shell
./install.sh
```

## Options

```lua
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.smartindent = true

vim.opt.mouse = "a"

vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = "split"

vim.opt.cursorline = true

vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking (copying) text",
        group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
        callback = function()
                vim.highlight.on_yank()
        end,
})
```

## Keymaps

### Personal

```lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-s>", ":w<CR>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to [P]revious [D]iagnostic message" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to [N]ext [D]iagnostic message" })
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show [D]iagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open [D]iagnostic [Q]uickfix list" })
```

### Comments

'gc' will activate the comment plugin. After choose how much you need to comment out

Keywords like "TODO:" and "NOTE:" etc is highlighted.

![Todo](https://user-images.githubusercontent.com/292349/118135272-ad21e980-b3b7-11eb-881c-e45a4a3d6192.png)

### Telescope

```lua
vim.keymap.set('n', '<leader>sh', builtin.help_tags,        { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps,          { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files,       { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin,          { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string,      { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', builtin.live_grep,     { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sg', builtin.git_files,        { desc = '[S]earch [G]it files' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics,      { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume,           { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles,         { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers,    { desc = '[ ] Find existing buffers' })

-- This searches your neovim config files from anywhere on your system
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })
```

### Snippets / Autocomplete

```lua
["<C-b>"] = cmp.mapping.scroll_docs(-4),
["<C-f>"] = cmp.mapping.scroll_docs(4),
["<C-Space>"] = cmp.mapping.complete(),
["<C-e>"] = cmp.mapping.abort(),
["<CR>"] = cmp.mapping.confirm({ select = true }),
```

### Git

```lua
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
```

### Harpoon

```lua
vim.keymap.set("n", "<leader>a", function()
  harpoon:list():append()
end, { desc = "Add file to harpoon list" })

vim.keymap.set("n", "<C-e>", function()
  toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
```

### LSP

```lua

--  To jump back, press <C-t>.
map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

-- Find references for the word under your cursor.
map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

-- Jump to the implementation of the word under your cursor.
--  Useful when your language has ways of declaring types without an actual implementation.
map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

-- Jump to the type of the word under your cursor.
--  Useful when you're not sure what type a variable is and you want to see
--  the definition of its *type*, not where it was *defined*.
map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

-- Fuzzy find all the symbols in your current document.
--  Symbols are things like variables, functions, types, etc.
map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

-- Fuzzy find all the symbols in your current workspace.
--  Similar to document symbols, except searches over your entire project.
map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

-- Rename the variable under your cursor.
--  Most Language Servers support renaming across files, etc.
map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

-- Opens a popup that displays documentation about the word under your cursor
--  See `:help K` for why this keymap.
map("K", vim.lsp.buf.hover, "Hover Documentation")

-- WARN: This is not Goto Definition, this is Goto Declaration.
--  For example, in C this would take you to the header.
map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
```

### Neotree

```lua
vim.keymap.set("n", "<C-n>", ":Neotree <CR>", {})
```

### Undotree

```lua
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
```

#### Vim stuff I need to know

operator - is what to do, such as d for delete
[number] - is an optional count to repeat the motion
motion - moves over the text to operate on, such as w (word)

A short list of motions:
w - until the start of the next word, EXCLUDING its first character.
e - to the end of the current word, INCLUDING the last character.
$ - to the end of the line, INCLUDING the last character.
0 - start of line
% - matching pair. I.e "(" matching ")"

- operators

  - d = delete
  - p = put
  - u = undo
  - r = replace
  - c = change

- searching
  - ESC + / + word = forward search
  - ESC + ? + word = backword search

To search the same phrase again type `n`
To search the same phrase in oposite direction type `N`

- substitute command

To substitute new for the first old in a line type :s/old/new
To substitute new for all 'old's on a line type :s/old/new/g
To substitute phrases between two line #'s type :#,#s/old/new/g
To substitute all occurrences in the file type :%s/old/new/g
To ask for confirmation each time add 'c' :%s/old/new/gc
