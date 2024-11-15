return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			local builtin = require('telescope.builtin')
			local action_state = require('telescope.actions.state')
			local actions = require('telescope.actions')
			vim.keymap.set('n', '..', builtin.find_files, {})
			vim.keymap.set('n', '<leader>.g', builtin.git_files, {})
			vim.keymap.set('n', '<leader>ps', function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") });
			end)
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		end,
	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},
}
