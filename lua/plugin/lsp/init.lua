local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("missing module lspconfig")
	return
end

require("plugin.lsp.mason")
require("plugin.lsp.handlers").setup()
