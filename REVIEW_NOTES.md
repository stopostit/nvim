# Neovim Lua Review Notes

## Applied Fixes (Committed)

Commit:
- `96b6e03`
- Message: `fix(nvim): modernize lsp and harden plugin config`

Changes included:
- Updated deprecated LSP format command to modern API in `lua/plugin/lsp/handlers.lua:78`
- Fixed broken cmp keymap token in `lua/plugin/completion.lua:81`
- Reworked Terraform filetype autocmds to safe augroup-based Lua autocmds in `lua/plugin/tf.lua:1`
- Replaced Treesitter `"all"` parser install with explicit language list in `lua/plugin/treesitter.lua:8`
- Removed deprecated unused module `lua/plugin/lsp/lsp-installer.lua`
- Included existing `ruby_lsp` removal in `lua/plugin/lsp/mason.lua:12`

Validation:
- `git status` clean after commit
- Headless Neovim load ran, but sandbox blocked ShaDa/log writes (permission warning), so full runtime validation is limited in this environment

## Startup/Lazy-Loading Follow-Up (Completed)

1. `lua/plugin/init.lua:6` eagerly loads Octo config every startup.
   - Done: removed eager `require "plugin.octo"` from `lua/plugin/init.lua`.

2. `lua/plugin/plugins.lua:54` Octo is currently a start plugin with no lazy trigger.
   - Done: added lazy `cmd` triggers and plugin config loader in `lua/plugin/plugins.lua`.

3. `lua/plugin/telescope/init.lua:7` unconditionally calls `telescope.load_extension('repo')` at startup.
   - Done: extension now loads on-demand via `:TelescopeRepo` in `lua/plugin/telescope/init.lua`.

4. `lua/plugin/completion.lua:131` always runs `require("cmp_git").setup()` on startup.
   - Done: `cmp-git` setup now runs only on `FileType gitcommit`; source is scoped to git commit buffers.

## Next Commit Options

1. Conservative lazy-load only: Octo + cmp-git
2. Broader lazy-load: Octo + cmp-git + Telescope repo extension + keymap adjustments
