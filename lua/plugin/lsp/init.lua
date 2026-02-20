if not vim.lsp or not vim.lsp.config or not vim.lsp.enable then
	vim.notify("Neovim LSP API (vim.lsp.config/enable) is unavailable")
	return
end

require("plugin.lsp.mason")
require("plugin.lsp.handlers").setup()
