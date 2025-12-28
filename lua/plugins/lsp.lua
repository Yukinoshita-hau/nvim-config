return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			-- ========== TypeScript/JavaScript ==========
			vim.lsp.config('ts_ls', {
				cmd = { 'typescript-language-server', '--stdio' },
				filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
				root_markers = { 'tsconfig.json', 'package.json', '.git' },
				capabilities = capabilities,
			})
			vim.lsp.enable('ts_ls')

			-- ========== Lua ==========
			vim.lsp.config('lua_ls', {
				cmd = { 'lua-language-server' },
				filetypes = { 'lua' },
				root_markers = { '.luarc.json', '.luarc.jsonc', 'stylua.toml', 'selene.toml', '.git' },
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
						},
						diagnostics = {
							globals = { 'vim' },
						},
						workspace = {
							library = {
								vim.fn.stdpath('config') .. '/lua',
								'${3rd}/luv/library',
								'${3rd}/busted/library',
							},
						},
					},
				},
			})
			vim.lsp.enable('lua_ls')

			-- ========== Java (JDTLS) ==========
			vim.lsp.config('jdtls', {
				cmd = { 'jdtls' },
				filetypes = { 'java' },
				root_markers = { 'pom.xml', 'build.gradle', '.git' },
				capabilities = capabilities,
				settings = {
					java = {
						eclipse = {
							downloadSources = true,
						},
						maven = {
							downloadSources = true,
						},
						implementationsCodeLens = {
							enabled = true,
						},
						referencesCodeLens = {
							enabled = true,
						},
					}
				}
			})
			vim.lsp.enable('jdtls')

			-- ========== LSP Keybindings ==========
			local opts = { noremap = true, silent = true }
			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
			end

			map('n', 'gd', vim.lsp.buf.definition, 'LSP: перейти к определению')
			map('n', 'K', vim.lsp.buf.hover, 'LSP: подсказка по символу')
			map('n', 'gi', vim.lsp.buf.implementation, 'LSP: реализации')
			map('n', 'gr', vim.lsp.buf.references, 'LSP: ссылки')
			map('n', '<leader>rn', vim.lsp.buf.rename, 'LSP: переименовать')
			map('n', '<leader>ca', vim.lsp.buf.code_action, 'LSP: code action')
			map("n", "<Leader>lf", function()
						vim.lsp.buf.format({ async = true })
					end, 'LSP: форматирование')

			-- ========== Diagnostic Config ==========
			vim.diagnostic.config({
				virtual_text = true,
				float = {
					source = 'always',
					border = 'rounded',
				},
				signs = true,
				underline = true,
				update_in_insert = false,
			})
		end
	}
}
