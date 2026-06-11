return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	init = function()
		local colors = require("catppuccin.palettes").get_palette("macchiato")

		require("catppuccin").setup({
			flavour = "macchiato",
			background = {
				light = "latte",
				dark = "macchiato",
			},
			transparent_background = true,
			show_end_of_buffer = false,
			term_colors = true,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			no_italic = true,
			no_bold = true,
			no_underline = true,
			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {},
			custom_highlights = {},
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = false,
					indentscope_color = "",
				},
			},
		})

	end,
}
