return {
	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
		},
		config = function()
			local lspconfig_defaults = require('lspconfig').util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			'force',
			lspconfig_defaults.capabilities,
			require('cmp_nvim_lsp').default_capabilities()
			)


			vim.api.nvim_create_autocmd('LspAttach', { 
				desc = "LSP Stuff",
				callback = function(event)
					local opts = { buffer = event.buf }
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
				end,
			})

			require('lspconfig').pylsp.setup({})
			require('lspconfig').clangd.setup({})
			require('lspconfig').bashls.setup({})
			require('lspconfig').rust_analyzer.setup({})
			require('lspconfig').lua_ls.setup({})

			vim.diagnostic.config({
				virtual_text = true,
			})

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
		end
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			ensure_installed = { "c", "cpp", "rust", "python" }
			sync_install = false
			auto_install = true
		end
	},
}
