local M = {}

function M.setup()
	require("copilot").setup({
		suggestion = { enabled = false },
		panel = { enabled = false },
	})

	local command = require("copilot.command")
	local client = require("copilot.client")

	-- Start disabled by default and let users opt in explicitly.
	command.disable()

	vim.api.nvim_create_user_command("CopilotToggle", function()
		if client.is_disabled() then
			command.enable()
			vim.notify("Copilot enabled", vim.log.levels.INFO)
		else
			command.disable()
			vim.notify("Copilot disabled", vim.log.levels.INFO)
		end
	end, { desc = "Toggle GitHub Copilot" })
end

return M
