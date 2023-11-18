require("gruvbox").setup({
	terminal_colors = true, -- add neovim terminal colors
	undercurl = false,
	underline = false,
	bold = false,
	italic = {
		strings = false,
		emphasis = false,
		comments = false,
		operators = false,
		folds = false,
	},
	strikethrough = false,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "hard", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = { CursorLineNr = { fg = "#fb4934", bg = "None" }, CursorLine = { bg = "None" } },
	dim_inactive = false,
	transparent_mode = true,
})

-- vim.cmd("colorscheme gruvbox")
