return {
	"rebelot/kanagawa.nvim",
	event = "ColorScheme",
	priority = 1000,
	init = function()
		require("kanagawa").setup({
			compile = true,
			transparent = true,
			dimInactive = false,
			terminalColors = true,
			overrides = function(colors)
				return {
					CursorLine = { link = "ColorColumn" },
					IncSearch = { bg = colors.palette.oniViolet, fg = colors.palette.sumiInk0 },
					Search = { bg = colors.palette.surimiOrange, fg = colors.palette.sumiInk0 },
				}
			end,
			themeOverrides = {
				default = {
					syn = {
						comment = false,
						keyword = false,
						type = false,
						operator = false,
						function_ = false,
						parameter = false,
					},
				},
			},
			background = {
				dark = "wave",
				light = "lotus",
			},
		})

	end,
}
