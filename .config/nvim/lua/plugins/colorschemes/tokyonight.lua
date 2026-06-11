return {
	"folke/tokyonight.nvim",
	event = "ColorScheme",
	priority = 1000,
	init = function()
		require("tokyonight").setup({
			style = "night",
			transparent = true,
			terminal_colors = true,
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				functions = { italic = false },
				variables = { italic = false },
				sidebars = "transparent",
				floats = "transparent",
			},
			sidebars = { "qf", "help" },
			day_boundary = false,
			on_colors = function(colors)
				colors.comment = "#7e9cd8"
			end,
			on_highlights = function(highlights, colors)
				highlights.CursorLine = { link = "ColorColumn" }
				highlights.IncSearch = { bg = colors.orange, fg = colors.bg }
				highlights.Search = { bg = colors.purple, fg = colors.bg }
			end,
		})

	end,
}
