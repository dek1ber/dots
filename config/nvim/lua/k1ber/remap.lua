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
}

for i,j in pairs(vals) do 
	vim.opt[i] = j
end

vim.keymap.set("n", "<C-t>", ":tabnew<CR>")
vim.keymap.set("n", "<C-w>", ":tabclose<CR>")

vim.keymap.set("n", "<C-x>k", ":vsplit<CR>")
vim.keymap.set("n", "<C-x>o", ":split<CR>")
