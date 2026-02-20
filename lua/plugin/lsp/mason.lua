local status_ok, _= pcall(require, "mason")
if not status_ok then
	vim.notify("missing module mason")
	return
end
if not vim.lsp or not vim.lsp.config or not vim.lsp.enable then
	vim.notify("Neovim LSP API (vim.lsp.config/enable) is unavailable")
	return
end

local servers = {
	"lua_ls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})


local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("plugin.lsp.handlers").on_attach,
		capabilities = require("plugin.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "plugin.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

		vim.lsp.config(server, opts)
		vim.lsp.enable(server)
end
