return {
	"ramojus/mellifluous.nvim",
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function()
		require("mellifluous").setup({
			dim_inactive = false,
			color_set = "mellifluous",
			styles = {
				comments = { italic = false },
				conditionals = { italic = false },
				folds = { italic = false },
				loops = { italic = false },
				functions = { italic = false },
				keywords = { italic = false },
				strings = { italic = false },
				variables = { italic = false, fg = "#b2b2b2" },
				numbers = { italic = false },
				booleans = { italic = false },
				properties = { italic = false },
				types = { italic = false },
				operators = { italic = false },
			},
			transparent_background = {
				enabled = true,
				floating_windows = true,
				telescope = true,
				file_tree = true,
				cursor_line = true,
				status_line = false,
			},
			flat_background = {
				line_numbers = true,
				floating_windows = false,
				file_tree = false,
				cursor_line_number = false,
			},
			plugins = {
				cmp = true,
				nvim_tree = {
					enabled = true,
					show_root = true,
				},
				telescope = {
					enabled = true,
					nvchad_like = true,
				},
			},
		})

		vim.cmd("colorscheme mellifluous")
	end,
}
