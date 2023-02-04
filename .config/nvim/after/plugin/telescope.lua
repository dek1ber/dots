local builtin = require('telescope.builtin')

vim.keymap.set('n', '.', builtin.find_files, {})
vim.keymap.set('n', '<C-x>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>.g', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
