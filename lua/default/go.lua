vim.opt.autowrite = true
vim.g.go_list_type = "quickfix"
vim.g.go_highlight_types = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_methods = 1
vim.g.go_fmt_command = "goimports"
vim.g.go_auto_type_info = 1 -- Set to 1 to automatically fetch the signature of everything
-- vim.g.go_metalinter_enabled = ['vet', 'golint', 'errcheck']
vim.cmd([[
let g:go_fmt_options = {
  \ 'gofmt': '-s',
  \ 'goimports': '-local github.com/Scalingo',
  \ }
]])
