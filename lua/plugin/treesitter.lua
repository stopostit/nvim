local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("nvim-treesitter not found")
	return
end

configs.setup({
	ensure_installed = { "bash", "go", "hcl", "json", "lua", "markdown", "markdown_inline", "ruby", "terraform", "vim", "vimdoc", "yaml" },
	highlight = {
		enable = false, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})
