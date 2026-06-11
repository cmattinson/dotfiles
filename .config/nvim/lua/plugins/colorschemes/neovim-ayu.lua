return {
	"Shatur/neovim-ayu",
	event = "ColorScheme",
	priority = 1000,
	init = function()
		-- local colors = {
		-- 	blue = "#39bae6",
		-- 	green = "#aad94c",
		-- 	yellow = "#ffb454",
		-- 	orange = "#ff8f40",
		-- 	red = "#d95757",
		-- 	purple = "#d2a644",
		-- }

		local colors = require("ayu.colors")
		colors.generate()

		require("ayu").setup({
			mirage = false,
			terminal = true,
			overrides = {
				DiagnosticUnderlineError = { undercurl = false },
				DiagnosticUnderlineHint = { undercurl = false },
				DiagnosticUnderlineInfo = { undercurl = false },
				DiagnosticUnderlineOK = { undercurl = false },
				DiagnosticUnderlineWarn = { undercurl = false },
				Function = { fg = colors.entity },
				MatchParen = { fg = colors.keyword, bold = true, underline = false },
				LspCodeLens = { fg = colors.lsp_inlay_hint },
			},
		})
	end,
}
