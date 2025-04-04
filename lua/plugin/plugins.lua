local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

	-- Colorschemes
	use "NLKNguyen/papercolor-theme"

	-- Workflow
	use "tpope/vim-surround"
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use {
		'pwntester/octo.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			'kyazdani42/nvim-web-devicons',
		}
	}

	-- cmp plugips
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp"
	use "petertriho/cmp-git"
	use "saadparwaiz1/cmp_luasnip"

	-- snippets --
	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets"

	-- lsp
	use "neovim/nvim-lspconfig"
	--	use "williamboman/nvim-lsp-installer"
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"

	-- Telescope
	use "nvim-telescope/telescope.nvim"
	use "cljoly/telescope-repo.nvim"
	-- use 'nvim-telescope/telescope-file-browser.nvim'

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	-- Dev
	use "fatih/vim-go"
	--
	-- Ops
	use "hashivim/vim-terraform"
	--
	-- Preview
	use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}

	-- Copilot
	-- use { "github/copilot.vim",
	-- 	config = function ()
	-- 		-- disable default tab behaviour to prevent cmp conflicts
	-- 		vim.g.copilot_no_tab_map = true
	-- 		vim.g.copilot_assume_mapped = true
	-- 		vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept()', {silent = true, expr = true})
	-- 	end
	-- }
	use {
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function ()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			}
			)
		end
	}

	use {
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function ()
			require("copilot_cmp").setup()
		end
	}

	--
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
