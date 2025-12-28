
return {
	'williamboman/mason.nvim',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		require('mason').setup()
		require('mason-lspconfig').setup({
			ensure_installed = { 'ts_ls', 'jdtls', 'lua_ls' },
			automatic_installation = true,
		})
	end
}
