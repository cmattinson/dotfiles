return {
	"ramojus/mellifluous.nvim",
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function()
		require("mellifluous.config").prepare()
		local cl = require("mellifluous.colors").get_colors()

		require("mellifluous").setup({
			dim_inactive = false,
			-- mellifluous, alduin, mountain, tender, kanagawa_dragon
			color_set = "mellifluous",
			styles = {
				comments = { italic = false },
				conditionals = { italic = false },
				folds = { italic = false },
				loops = { italic = false },
				functions = { italic = false },
				keywords = { italic = false, fg = cl.red },
				strings = { italic = false },
				variables = { italic = false, fg = cl.orange },
				numbers = { italic = false },
				booleans = { italic = false },
				properties = { italic = false },
				types = { italic = false },
				operators = { italic = false },
			},
			highlight_overrides = {
				dark = function(highlighter, colors)
					highlighter.set("@variable.member", { fg = colors.orange:darkened(10) })
				end,
			},
			transparent_background = {
				enabled = false,
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
					enabled = false,
					show_root = true,
				},
				telescope = {
					enabled = false,
					nvchad_like = true,
				},
			},
		})

		vim.cmd("colorscheme mellifluous")
	end,
}
