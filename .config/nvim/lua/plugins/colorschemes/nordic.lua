return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	enabled = false,
	config = function()
		local colors = require("nordic.colors.nordic")

		require("nordic").setup({
			bold_keywords = false,
			italic_comments = false,
			transparent_bg = true,
			bright_border = false,
			reduced_blue = false,
			swap_backgrounds = false,
			override = {
				["@parameter"] = { italic = false, fg = colors.red.base },
				Delimiter = { italic = false },
				DiagnosticHint = { fg = colors.magenta.base },
				DiagnosticHintSign = { fg = colors.magenta.base },
				DiagnosticUnderlineError = { undercurl = false },
				DiagnosticUnderlineHint = { fg = colors.magenta.base, undercurl = false },
				DiagnosticUnderlineInfo = { fg = colors.cyan.base, undercurl = false },
				DiagnosticUnderlineOK = { fg = colors.green.base, undercurl = false },
				DiagnosticUnderlineWarn = { fg = colors.yellow.base, undercurl = false },
				MatchParen = { fg = colors.yellow.base, underline = false, bold = false },
			},
			cursorline = {
				bold_number = true,
			},
			telescope = {
				style = "flat",
			},
			ts_context = {
				dark_background = true,
			},
		})

		require("nordic").load()
	end,
}
