local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Normal --
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Split management
vim.keymap.set("n", "vv", "<cmd>vsplit<cr>", opts)
vim.keymap.set("n", "vV", "<cmd>split<cr>", opts)
vim.keymap.set("n", "vq", "<C-w>q", opts)
-- tab management
vim.keymap.set("n", "<leader>tq", "<cmd>tab close <cr>", opts)
-- Open Netrw --
vim.keymap.set("n", "<leader>e", "<cmd>Lex 10<cr>", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)


-- Terminal --
-- Better terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
--  keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<C-p>", function()
	require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({ previewer = false }))
end, opts)
vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
