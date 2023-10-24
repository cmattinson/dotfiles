-- Default options
require("github-theme").setup({
	options = {
		hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
		hide_nc_statusline = true, -- Override the underline style for non-active statuslines
		transparent = true, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		module_default = true, -- Default enable value for modules
		styles = { -- Style to be applied to different syntax groups
			comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
			functions = "NONE",
			keywords = "NONE",
			variables = "NONE",
			conditionals = "NONE",
			constants = "NONE",
			numbers = "NONE",
			operators = "NONE",
			strings = "NONE",
			types = "NONE",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = false,
			visual = false,
			search = false,
		},
		darken = { -- Darken floating windows and sidebar-like windows
			floats = false,
			sidebars = {
				enable = true,
				list = {}, -- Apply dark background to specific windows
			},
		},
	},
	palettes = {},
	specs = {},
	groups = {
		github_dark_tritanopia = {
			CursorLineNr = { fg = "#ff7b72" },
			Number = { fg = "#ffa198" },
		},
	},
})

-- vim.cmd("colorscheme github_dark_tritanopia")
