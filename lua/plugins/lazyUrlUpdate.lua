return {
	{
		-- "cxwx/lazyUrlUpdate.nvim", -- github plugin will be removed soon.
		url = "https://codeberg.org/chenxu/lazyUrlUpdate.nvim",
		ft = "lua",
		opts = {},
		keys = {
			{ "<leader>up", "<cmd>LazyUrlUpdate<CR>", desc = "Update plugin under cursor" },
			{ "<leader>bp", "<cmd>LazyUrlBuild<CR>",  desc = "Build plugin under cursor" },
		}
	},
}
