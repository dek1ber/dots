local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
	vim.keymap.set("n", "gd", '<cmd>Telescope lsp_references<cr>', {buffer = bufnr})
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'clangd', 'pylsp', 'bashls', 'rust_analyzer', 'lua_ls'},
	handlers = {
		lsp_zero.default_setup,
	},
})

lsp_zero.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})

vim.diagnostic.config({
	virtual_text = true,
})

lsp_zero.setup()

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
	},
	mapping = cmp.mapping.preset.insert({
					
		-- Enter key confirms completion item
		['<CR>'] = cmp.mapping.confirm({select = false}),

		-- Ctrl + space triggers completion menu
		--['<C-Space>'] = cmp.mapping.complete(),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})
