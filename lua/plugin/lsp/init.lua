local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	-- TODO: notify
	return
end

require("plugin.lsp.lsp-installer")
require("plugin.lsp.handlers").setup()
