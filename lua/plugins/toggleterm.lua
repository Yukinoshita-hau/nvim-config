return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,

		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-t>]],
			})
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				local function term_map(lhs, rhs, desc)
					vim.keymap.set('t', lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
				end

				term_map('<esc>', [[<C-\><C-n>]], "Выйти из терминала (Esc)")
				term_map('jj', [[<C-\><C-n>]], "Выйти из терминала (jj)")
				term_map('<C-h>', [[<Cmd>wincmd h<CR>]], "Фокус на окно слева")
				term_map('<C-j>', [[<Cmd>wincmd j<CR>]], "Фокус на окно снизу")
				term_map('<C-k>', [[<Cmd>wincmd k<CR>]], "Фокус на окно сверху")
				term_map('<C-l>', [[<Cmd>wincmd l<CR>]], "Фокус на окно справа")
				term_map('<C-w>', [[<C-\><C-n><C-w>]], "Управление окнами из терминала")
			end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
		end
	}
}
