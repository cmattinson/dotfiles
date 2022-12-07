require("meliora").setup({
	dim_inactive = false,
	color_set = "mountain",
	styles = {
		comments = "NONE",
		conditionals = "NONE",
		folds = "NONE",
		loops = "NONE",
		functions = "NONE",
		keywords = "NONE",
		strings = "NONE",
		variables = "NONE",
		numbers = "NONE",
		booleans = "NONE",
		properties = "NONE",
		types = "NONE",
		operators = "NONE",
	},
	transparent_background = {
		enabled = false,
		floating_windows = false,
		telescope = true,
		file_tree = true,
		cursor_line = true,
		status_line = false,
	},
	plugins = {
		cmp = true,
		indent_blankline = true,
		nvim_tree = {
			enabled = true,
			show_root = false,
		},
		telescope = {
			enabled = true,
			nvchad_like = true,
		},
		startify = true,
	},
})

-- vim.cmd[[colorscheme meliora]]
