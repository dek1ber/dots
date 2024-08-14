vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local vals = {
	mouse = "a",
	backup = false,
	ignorecase = true,
	smartindent = true,
	relativenumber = true,
	splitbelow = true,
	splitright = true,
	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2,
}

for i,j in pairs(vals) do 
	vim.opt[i] = j
end

vim.keymap.set("n", "<C-t>", ":tabnew<CR>")
vim.keymap.set("n", "<C-w>", ":tabclose<CR>")
vim.keymap.set("n", "<C-h>", ":tabprev<CR>")
vim.keymap.set("n", "<C-l>", ":tabnext<CR>")

vim.keymap.set("n", "<leader>k", ":vsplit<CR>")
vim.keymap.set("n", "<leader>o", ":split<CR>")
