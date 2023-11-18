require("onedark").setup({
	style = "deep",
	transparent = true,
	term_colors = true,
	ending_tildes = false,
	cmp_itemkind_reverse = false,
	code_style = {
		comments = "NONE",
		keywords = "NONE",
		functions = "NONE",
		strings = "NONE",
		variables = "NONE",
	},
	lualine = {
		transparent = false,
	},
	colors = {},
	highlights = { CursorLine = { bg = "NONE", fg = "NONE" }, CursorLineNr = { bg = "NONE", fg = "#c75ae8" } }, -- Override highlight groups
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})

-- require("onedark").load()
