return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},

	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
		}
	},

	{ "miikanissi/modus-themes.nvim" },

	{
		"shaunsingh/nord.nvim",
		init = function()
			vim.g.nord_italic = false
		end
	},
}
