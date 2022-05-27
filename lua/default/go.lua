vim.cmd([[
set autowrite " Automatically save the file if GoBuild is called
let g:go_list_type = "quickfix" "

" Coloration syntaxique
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" Whenever we save, call
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {
  \ 'gofmt': '-s',
  \ 'goimports': '-local github.com/Scalingo',
  \ }
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_decls_includes = "func,type" " GoDecls gives functions and types names
let g:go_auto_type_info = 0 " Set to 1 to automatically fetch the signature of everything
]])
