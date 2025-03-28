local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	vim.notify("cmp module not found")
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	vim.notify("luasnip module not found")
	return
end

require("luasnip.loaders.from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm { select = true },
		-- Expand pr move in snippets
		["<C-k>"] = cmp.mapping(function(fallback)
			if  luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, {
		"i",
		"s",
	}),
	["<C-j"] = cmp.mapping(function(fallback)
		if  luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, {
	"i",
	"s",
}),
  },
  formatting = {
	  fields = { "kind", "abbr", "menu" },
	  format = function(entry, vim_item)
		  -- Kind icons
		  vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
		  -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
		  vim_item.menu = ({
			  nvim_lua = "[LSP_LUA]",
			  nvim_lsp = "[LSP]",
			  copilot = "[Copilot]",
			  luasnip = "[Snippet]",
			  buffer = "[Buffer]",
			  path = "[Path]",
			  cmp_git = "[Git]",
		  })[entry.source.name]
		  return vim_item
	  end,
  },
  sources = {
	  { name = "nvim_lua" },
	  { name = "nvim_lsp" },
	  { name = "copilot" },
	  { name = "luasnip" },
	  { name = "buffer" },
	  { name = "path" },
	  { name = "cmp_git" },
  },
  confirm_opts = {
	  behavior = cmp.ConfirmBehavior.Replace,
	  select = false,
  },
  experimental = {
	  ghost_text = true,
	  native_menu = false,
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
}
require("cmp_git").setup()
