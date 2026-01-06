return {
	"ggandor/leap.nvim",
	lazy = false,
	config = function()
		vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap-forward)', { noremap = true })
		vim.keymap.set({ 'n', 'x', 'o' }, 'F', '<Plug>(leap-backward)', { noremap = true })
	end,
}
