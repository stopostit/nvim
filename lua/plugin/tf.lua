local tf_group = vim.api.nvim_create_augroup("TerraformFiletypes", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = tf_group,
	pattern = "*.hcl",
	command = "setfiletype hcl",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = tf_group,
	pattern = { ".terraformrc", "terraform.rc" },
	command = "setfiletype hcl",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = tf_group,
	pattern = { "*.tf", "*.tfvars" },
	command = "setfiletype terraform",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = tf_group,
	pattern = { "*.tfstate", "*.tfstate.backup" },
	command = "setfiletype json",
})

vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])
