local builtin = require('telescope.builtin')
local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

vim.keymap.set('n', '..', builtin.find_files, {})
vim.keymap.set('n', '<leader>.g', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local buffer_searcher = function ()
	builtin.buffers {
		sort_mru = true,
		ignore_current_buffer = false,
		show_all_buffers = false,
		attach_mappings = function(prompt_bufnr, map)
			local refresh_buffer_searcher = function() 
				actions.close(prompt_bufnr)
			end
			local delete_buf = function()
				local selection = action_state.get_selected_entry()
				vim.api.nvim_buf_delete(selection.bufnr, { force = true})
				refresh_buffer_searcher()
			end
			local delete_multiple_buf = function()
				local picker = action_state.get_current_picker(prompt_bufnr)
				local selection = picker:get_multi_selection()
				for _, entry in ipairs(selection) do
					vim.api.nvim_buf_delete(entry.bufnr, { force = true })
				end
				refresh_buffer_searcher()
			end
			map('n', 'dd', delete_buf)
			map('n', 'dfd', delete_multiple_buf)
			map('i', 'dfd', delete_multiple_buf)
			return true
		end
	}
end

--vim.keymap.set('n', '<leader>bi', builtin.buffers, {})
vim.keymap.set('n', '<leader>bi', buffer_searcher, {})
