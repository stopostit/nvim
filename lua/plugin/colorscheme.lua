-- It looks like the plugins are lazy loaded, and defering this method fix an
-- issue where colorscheme plugio would not be loaded.
vim.defer_fn(function()
	local colorscheme = "PaperColor"

	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
		vim.notify("colorscheme " .. colorscheme .. " not found!", vim.log.levels.ERROR)
		return
	end
end, 0)
