return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = 'gruvbox-material',
					icons_enabled = true,
					component_separators = { left = '', right = '' },
					section_separators = { left = '', right = '' },
				},

				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch', 'diff', 'diagnostics' },
					lualine_c = {
						{
							'filename',
							file_status = true,
							path = 1,
							shorting_target = 40,
							symbols = {
								modified = '[Modified]',
								readonly = '[Readonly]',
								unnamed = '[No Name]',
								newfile = '[New]',
							}
						},
						"hostname",
						'filesize'
					},
					lualine_x = { 'encoding', 'fileformat', 'filetype' },
					lualine_y = { 'progress' },
					lualine_z = { 'location' }
				},
			})
		end
	}
}
