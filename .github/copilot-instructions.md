# Copilot Instructions

## Docker Services

Services live under `docker/<service>/` and are designed for deployment on [Coolify](https://coolify.io).

**Structure per service:**
- `docker-compose.yml` — the compose file, Coolify is the deployment target
- Any config files that are Coolify persisted storage (editable via Coolify UI)

**Conventions:**
- **Always look up the latest image version and configuration options online** before creating or updating service files.
- Game/data volumes use named Docker volumes (not bind mounts) to keep data managed by Docker.
- Config files that need to be editable in the Coolify UI are bind-mounted as Coolify persisted storage. In the Coolify UI go to Persistent Storage and add a bind mount pointing to the file. Set `DISABLE_GENERATE_SETTINGS=true` (or equivalent) to prevent the container from overwriting a manually managed config.
- Ports are mapped directly in `ports:` (bypassing Traefik) for any UDP or non-HTTP traffic.
- Environment variables that should be configurable in the Coolify UI use `${VAR:-default}` syntax; required secrets use `${VAR:?}`.
- Always include `restart: unless-stopped` and an appropriate `stop_grace_period` to allow clean shutdowns.
- Start each compose file with a comment block explaining the image source and any Coolify-specific deployment notes.

## Repository Overview

This is a personal dotfiles repository managed with [GNU Stow](https://www.gnu.org/software/stow/). Running `stow . -t ~/` from the repo root symlinks all tracked files into `$HOME`, mirroring the directory structure exactly.

## Deployment

```bash
./stow.sh        # Deploy dotfiles (backs up existing ~/.zshrc first)
```

To re-apply after changes: `stow . -t ~/` from the repo root.

## Architecture

- **`.zshrc`** — Oh My Zsh with Powerlevel10k theme. Plugins: `git`, `zsh-syntax-highlighting`, `zsh-autosuggestions`. Leader in the shell is Space (via tmux prefix `C-a`).
- **`.config/tmux/`** — tmux config with TPM. Catppuccin Mocha theme. Prefix is `C-a`. Session persistence via tmux-resurrect + tmux-continuum.
- **`.config/nvim/`** — Neovim config using lazy.nvim. Entry point is `init.lua`, which loads four config modules then lazy imports all plugin specs from `lua/plugins/`.
- **`.config/btop/`**, **`.config/conky/`** — btop and conky configs.

## Neovim Plugin Conventions

- Each plugin lives in its own file under `lua/plugins/`. Add new plugins by creating a new file there — lazy.nvim auto-imports all files in that directory.
- Every plugin file starts with a URL comment pointing to its GitHub repo (e.g., `-- https://github.com/...`).
- Plugin specs return a table (or array of tables for related plugins grouped together).
- `mapleader` is `Space`, `maplocalleader` is `\`.

## Neovim Formatting

- **Lua**: `stylua` — single quotes preferred (`AutoPreferSingle`), 80-column width, 2-space indent.
- **JS/TS/JSX/TSX/JSON/YAML/HTML/CSS/Markdown**: `oxfmt` first, `prettier` as fallback (`stop_after_first = true`).
- **C#**: Roslyn LSP formatter.
- Format-on-save is enabled globally via conform.nvim.

## Neovim LSP

- **Lua**: `lua_ls` via lazydev.nvim
- **TypeScript**: `tsgo` + `oxlint` (oxlint uses `.git` as fallback root marker for monorepos)
- **C#**: `roslyn.nvim` + `rzls.nvim` — automatically selects the `WISE.slnx` solution file
- **Markdown**: `marksman`
- Mason auto-installs: `lua_ls`, `stylua`, `tsgo`, `oxlint`, `oxfmt`, `marksman`
