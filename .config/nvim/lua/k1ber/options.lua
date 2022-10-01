-- Options for neovim

local options = {
	backup = false,
	mouse = "a",
	clipboard = "unnamedplus",
	hlsearch = false,
	ignorecase = true,
	smartindent = true,
	smartcase = true,
	showmode = false,
	number = true,
	relativenumber = true,
	tabstop = 2,
	shiftwidth = 2,
	splitbelow = true,
	splitright = true,
	termguicolors = true,
	swapfile = false,
	pumheight = 10,
	completeopt = {"menuone", "noselect" },
	conceallevel = 0,
	fileencoding = "utf-8",
	cursorline = false,
	guifont = "monospace:h17",
	guicursor = "",
	pumheight = 10,
	cmdheight = 2,
	signcolumn = "yes",
}

vim.opt.shortmess:append "c"

for x,y in pairs(options) do
	vim.opt[x] = y
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
local status_ok, telescope = pcall(vim.cmd, "colorscheme dracula")
if not status_ok then
  return
end

-- Keymaps for neovim

local opts = {noremap = true, silent = true}
local term_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap

-- Space as leader
keymap ("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " " 

-- Tabs
keymap("n", "<C-t>", ":tabnew<CR>", opts)
keymap("n", "<C-w>", ":tabclose<CR>", opts)
keymap("n", "<S-l>", ":tabnext<CR>", opts)
keymap("n", "<S-h>", ":tabprevious<CR>", opts)

-- Telescope
keymap("n", ".", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>.h", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>.b", ":Telescope buffers<CR>", opts)
