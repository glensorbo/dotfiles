# Neovim Config — Copilot Instructions

This is a personal Neovim configuration. Use this file as the authoritative
reference before making any changes.

---

## Structure

```
~/.config/nvim/
├── init.lua                  # Entry point — loads config modules in order
├── lazy-lock.json            # Lazy.nvim lockfile — do not edit manually
├── snippets/                 # VSCode-style snippets loaded by LuaSnip
└── lua/
    ├── config/
    │   ├── lazy.lua          # Lazy.nvim bootstrap + leader key setup
    │   ├── options.lua       # vim.opt settings
    │   ├── keymaps.lua       # Global keymaps (non-plugin-specific)
    │   └── autocmd.lua       # Autocommands (LSP attach, yank highlight, etc.)
    └── plugins/              # One file per plugin (auto-imported by Lazy)
```

`init.lua` loads in this order: `lazy` → `options` → `keymaps` → `autocmd`.
Leader keys (`<Space>` / `\`) are set in `lazy.lua` **before** Lazy loads.

---

## Plugin Manager

**Lazy.nvim** (stable branch). All files under `lua/plugins/` are
auto-imported via `{ import = "plugins" }`. Each file returns a plugin spec
table (or a list of specs for related plugins grouped together).

- Use `opts = {}` for simple configuration — Lazy merges opts from multiple
  specs for the same plugin via `opts_extend`.
- Use `config = function(_, opts)` when setup requires logic that must run
  **after** the plugin is loaded (e.g. calling `require("plugin").setup()`).
- **Never** call `require("some-plugin")` at the top level of a plugin spec
  file. It runs at spec-load time, before the plugin is available, and will
  throw "module not found". Always place requires inside `config`, `init`, or
  key handler functions.
- `init` runs before the plugin loads (use for `vim.g.*` globals that must be
  set first, like `vim.g.copilot_no_maps = true`).

---

## Installed Plugins

### Core / UI
| File | Plugin | Purpose |
|------|--------|---------|
| `catppuccin.lua` | catppuccin/nvim | Colorscheme (flavour: **macchiato**) |
| `alpha.lua` | goolord/alpha-nvim | Start screen (startify theme, custom Neovim ASCII logo) |
| `lua-line.lua` | nvim-lualine/lualine.nvim | Status line (theme: **codedark**, icons disabled) |
| `bufferline.lua` | akinsho/bufferline.nvim | Tab/buffer bar with LSP diagnostics |
| `snacks.lua` | folke/snacks.nvim | UI Swiss-army knife — see section below |

### File Navigation
| File | Plugin | Purpose |
|------|--------|---------|
| `neotree.lua` | nvim-neo-tree/neo-tree.nvim | File tree sidebar (branch: v3.x) |
| `fzf.lua` | ibhagwan/fzf-lua | Fuzzy finder (used for project file find, live grep, diagnostics) |

### LSP / Completion / Snippets
| File | Plugin | Purpose |
|------|--------|---------|
| `mason.lua` | mason-org/mason-lspconfig.nvim | LSP server installer with custom registries |
| `lsp.lua` | folke/lazydev.nvim + seblyng/roslyn.nvim | Lua type hints; C# LSP via Roslyn |
| `blink.lua` | saghen/blink.cmp | Completion engine (preset: default, Tab to accept) |
| `copilot.lua` | github/copilot.vim + fang2hou/blink-copilot | Copilot inline + as blink source |
| `luasnip.lua` | L3MON4D3/LuaSnip | Snippet engine (VSCode snippets from `snippets/` dir) |

### Formatting / Linting
| File | Plugin | Purpose |
|------|--------|---------|
| `conform.lua` | stevearc/conform.nvim | Formatter (format on save + `<leader>f`) |
| `nvim-lint.lua` | esmuellert/nvim-eslint | ESLint via LSP protocol |

### Git
| File | Plugin | Purpose |
|------|--------|---------|
| `git-gutter.lua` | airblade/vim-gitgutter | Gutter signs for hunks (custom bar characters, no nerd font icons) |
| `git-blame.lua` | f-person/git-blame.nvim | Blame shown in lualine (virtual text disabled) |

### Editor Enhancements
| File | Plugin | Purpose |
|------|--------|---------|
| `treesitter.lua` | nvim-treesitter/nvim-treesitter | Syntax/parsing (**main** branch, not master) |
| `render-markdown.lua` | MeanderingProgrammer/render-markdown.nvim | Rendered markdown in normal mode |
| `todo-comments.lua` | folke/todo-comments.nvim | Highlighted TODO/FIXME/etc. comments |
| `undotree.lua` | mbbill/undotree | Visual undo history (`~/.vim/undodir`) |
| `copilot-chat.lua` | CopilotC-Nvim/CopilotChat.nvim | Copilot chat panel |

---

## Snacks.nvim

`snacks.lua` is a large, central file. It provides:

- **Picker** (replaces Telescope) — fuzzy find for files, grep, git, LSP, etc.
- **Explorer** — lightweight file explorer (`<leader>e`)
- **Notifier** — replaces `vim.notify` (timeout: 3000ms)
- **Terminal** — floating terminal (`<C-/>`)
- **Zen / Scratch / Words / Statuscolumn / Bigfile / Quickfile**

**Disabled** snacks features: `animate`, `dashboard`, `indent`, `scope`, `scroll`.
`dashboard` is disabled because `alpha.lua` handles the start screen.
`animate` is disabled globally (also set via `vim.g.snacks_animate = false` in snacks itself — do not re-add it to `options.lua`).

Snacks picker is the **primary** tool for LSP navigation (`gd`, `gD`, `gr`, `gI`, `gy`).
Do not add duplicate LSP navigation keymaps elsewhere.

---

## LSP Setup

- **TypeScript/JavaScript**: `ts_ls` via mason-lspconfig (`automatic_enable = true`)
- **Lua**: `lua_ls` via mason-lspconfig
- **C#**: `roslyn.nvim` (custom plugin, NOT via mason-lspconfig). Configured in
  `lsp.lua`. Hardcoded to find `WISE.slnx` solution file — update this if the
  solution name changes.
- **Markdown**: `marksman` via mason-lspconfig
- **Linting**: `oxlint` enabled via autocmd in `autocmd.lua` for JS/TS filetypes
  (not via mason LSP auto-enable — it's manually triggered with `vim.lsp.enable`)

LSP keymaps split across two places:
- **Buffer-local** (set in `autocmd.lua` `LspAttach`): `<leader>ca`, `K`, `gi`
- **Global via Snacks picker**: `gd`, `gD`, `gr`, `gI`, `gy`, `<leader>ss`, `<leader>sS`
- **Global in keymaps.lua**: `<leader>cr` (rename), `<leader>co` (TS source action),
  `<leader>dp`/`<leader>dn`/`<leader>de`/`<leader>dq` (diagnostics)

---

## Formatting (conform.nvim)

Format on save is **always on** (`format_on_save = { timeout_ms = 1000 }`).
Manual format: `<leader>f` (formats async, then writes).

**Formatter priority**: `oxfmt` → `prettier` → LSP fallback (`stop_after_first = true`)

`oxfmt` is installed **globally** on the system (not per-project in node_modules).
The custom formatter definition in `conform.lua` overrides the built-in one to
search for prettier config files (`.prettierrc`, `prettier.config.js`,
`package.json`, etc.) as project root markers, enabling oxfmt's Prettier
compatibility mode.

Filetypes and their formatters:
| Filetype | Formatter |
|----------|-----------|
| `lua` | stylua |
| `javascript`, `javascriptreact`, `typescript`, `typescriptreact` | oxfmt → prettier |
| `json`, `jsonc` | oxfmt → prettier |
| `yaml`, `toml` | oxfmt → prettier |
| `html`, `vue` | oxfmt → prettier |
| `css`, `scss`, `less` | oxfmt → prettier |
| `markdown` | oxfmt → prettier |
| `graphql` | oxfmt → prettier |
| `cs` | roslyn (LSP fallback) |

---

## Treesitter

Uses the **main** branch (`branch = "main"`), which is the rewritten version.
- The old `require("nvim-treesitter.configs").setup()` API **does not exist** on
  this branch. Use `require("nvim-treesitter").setup()` instead.
- `ensure_installed` parsers: lua, markdown, markdown\_inline, javascript,
  typescript, tsx, c\_sharp, json, yaml, toml, http
- Custom filetype mappings: `.http` and `.rest` → `http` filetype

---

## Completion (blink.cmp)

Two specs contribute to blink.cmp (Lazy merges them via `opts_extend`):

1. **`blink.lua`** — main config: keymap preset `default`, Tab to accept,
   `sources.default = { "lsp", "path", "snippets", "buffer" }`,
   luasnip preset for snippets, Rust fuzzy matcher.
2. **`copilot.lua`** — adds copilot source: appended to `sources.default`
   via `opts_extend`, `score_offset = 100` so it appears at the top.

`blink.compat` is an optional dependency for any extras that need it.
`auto_brackets` is disabled. `documentation` popup requires manual trigger (`C-space`).

---

## Keymaps Reference

### Leader = `<Space>`, LocalLeader = `\`

#### Navigation
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between windows |
| `<S-H>` / `<S-L>` | Previous / next buffer |
| `<C-Up/Down/Left/Right>` | Resize window (normal mode) |
| `<C-Up/Down>` | Move line up/down (visual mode) |
| `]]` / `[[` | Next / prev word reference (Snacks words) |

#### Files & Search (Snacks picker)
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Find git files |
| `<leader>fr` | Recent files |
| `<leader>fc` | Find in nvim config |
| `<leader>fp` | Projects |
| `<leader>sg` | Grep |
| `<leader>sw` | Grep word/selection |
| `<leader>sb` | Buffer lines |
| `<leader>sB` | Grep open buffers |
| `<leader><leader>` | Find files (fzf-lua, project dir) |
| `<leader>fl` | Live grep (fzf-lua) |
| `<leader>fd` | Document diagnostics (fzf-lua) |

#### Git (Snacks picker)
| Key | Action |
|-----|--------|
| `<leader>gb` | Git branches |
| `<leader>gl` | Git log |
| `<leader>gs` | Git status |
| `<leader>gd` | Git diff hunks |
| `<leader>gB` | Git browse |
| `<leader>gg` | Lazygit |

#### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition (Snacks) |
| `gD` | Go to declaration (Snacks) |
| `gr` | References (Snacks) |
| `gI` | Implementations (Snacks) |
| `gy` | Type definition (Snacks) |
| `gi` | Implementation (LSP direct, buffer-local) |
| `K` | Hover docs (buffer-local) |
| `<leader>ca` | Code action (buffer-local) |
| `<leader>cr` | Rename symbol |
| `<leader>cR` | Rename file (Snacks) |
| `<leader>co` | TypeScript source action |
| `<leader>ss` | LSP symbols |
| `<leader>sS` | LSP workspace symbols |
| `<leader>dp` / `<leader>dn` | Prev/next diagnostic |
| `<leader>de` | Show diagnostic float |
| `<leader>dq` | Diagnostic quickfix list |

#### Buffers
| Key | Action |
|-----|--------|
| `<leader>bd` | Delete buffer (Snacks) |
| `<leader>bo` | Delete other buffers |
| `<leader>fb` | Buffers picker (Snacks) |

#### UI Toggles (Snacks)
| Key | Action |
|-----|--------|
| `<leader>us` | Toggle spelling |
| `<leader>uw` | Toggle wrap |
| `<leader>ud` | Toggle diagnostics |
| `<leader>ul` / `<leader>uL` | Toggle line/relative numbers |
| `<leader>uc` | Toggle conceallevel |
| `<leader>uh` | Toggle inlay hints |
| `<leader>ub` | Toggle dark background |
| `<leader>uT` | Toggle treesitter |
| `<leader>uC` | Colorschemes picker |

#### Misc
| Key | Action |
|-----|--------|
| `<leader>f` | Format buffer |
| `<leader>u` | Toggle undotree |
| `<leader>cp` | Toggle Copilot Chat |
| `<leader>ze/zo/zr/zd/zt` | Copilot Chat actions (visual mode) |
| `<leader>z` / `<leader>Z` | Zen mode / Zoom |
| `<leader>.` | Scratch buffer |
| `<leader>n` | Notification history (Snacks picker) |
| `<leader>un` | Dismiss all notifications |
| `<C-/>` | Toggle terminal |
| `<Esc>` | Clear search highlight |
| `jj` | Escape from insert mode |
| `<C-s>` | Start substitute command (`:%s/`) |
| `<C-n>` | Toggle Neo-tree |
| `<leader>e` | Snacks explorer |

---

## Important Rules & Gotchas

1. **No `require()` at spec top-level.** Always inside `config`, `init`, or
   handler closures. This is the most common source of "module not found" errors.

2. **Treesitter main branch API.** Use `require("nvim-treesitter").setup()`.
   The `nvim-treesitter.configs` module does not exist on the main branch.

3. **Snacks owns most keymaps.** Before adding a keymap to `keymaps.lua` or
   any plugin file, check `snacks.lua` first to avoid duplicates.
   The confirmed duplicates that were removed: `<leader>bd`, `<leader>cR`,
   `<leader>n` (notifier.show_history), `<leader>sb` (second occurrence).

4. **blink.cmp opts\_extend.** `copilot.lua` extends `sources.default` — it does
   NOT replace it. The final default sources are:
   `{ "lsp", "path", "snippets", "buffer", "copilot" }`.

5. **fzf-lua and Snacks picker coexist.** They handle different keymaps.
   Conflicts previously removed: `<leader>fc` (removed from fzf), `<leader>fb`
   renamed to `<leader>fB` in fzf. Do not reintroduce these conflicts.

6. **oxfmt is global.** Do not configure oxfmt to use `util.from_node_modules`.
   The formatter spec in `conform.lua` uses `command = "oxfmt"` directly.

7. **git-blame require.** `lua-line.lua` requires git-blame inside `config` (not
   at top-level). It declares `"f-person/git-blame.nvim"` as a dependency to
   guarantee load order.

8. **Roslyn solution.** `lsp.lua` has a hardcoded `string.match(item, "WISE.slnx")`
   to auto-select the C# solution. Update this if the project changes.

9. **Spell check is always on.** Language: `en_gb`, with `camel` word splitting.
   The SpellBad highlight is overridden in `autocmd.lua` to a blue undercurl.

10. **Mason custom registry.** `mason.lua` includes `github:Crashdummyy/mason-registry`
    alongside the official one — required for `roslyn` to be available in Mason.

11. **mcpHub.lua** exists as `return {}` (fully commented out). It can be
    uncommented to enable MCP Hub integration with CopilotChat.

12. **Alpha vs Snacks dashboard.** `snacks.lua` has `dashboard = { enabled = false }`.
    `alpha.lua` is used instead. Do not enable snacks dashboard without removing alpha.

---

## Mason-installed Tools

| Tool | Type | Used by |
|------|------|---------|
| `ts_ls` | LSP server | TypeScript/JavaScript |
| `lua_ls` | LSP server | Lua |
| `oxlint` | Linter/LSP | JS/TS (via autocmd, not auto-enable) |
| `stylua` | Formatter | Lua (via conform) |
| `marksman` | LSP server | Markdown |

`roslyn` (C# LSP) is **not** in mason ensure\_installed — it is managed
separately by `roslyn.nvim` with the custom Crashdummyy registry.

---

## Adding a New Plugin

1. Create `lua/plugins/<name>.lua` returning a valid Lazy spec.
2. Use `opts = {}` if no requires needed at setup time.
3. Use `config = function(_, opts)` if `require()` calls are needed.
4. Check for keymap conflicts against `snacks.lua`, `keymaps.lua`, and
   `autocmd.lua` before defining new keys.
5. If the plugin needs a Mason tool, add it to `mason.lua` `ensure_installed`.
6. If the plugin depends on treesitter parsers, add them to `treesitter.lua`
   `ensure_installed`.
