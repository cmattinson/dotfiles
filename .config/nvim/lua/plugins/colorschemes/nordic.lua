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
			transparent = {
				bg = true,
				float = true,
			},
			bright_border = false,
			reduced_blue = false,
			swap_backgrounds = false,
			on_highlight = function(highlights, _palette)
				highlights["@parameter"] = { italic = false, fg = colors.red.base }
				highlights.Delimiter = { italic = false }
				highlights.DiagnosticHint = { fg = colors.magenta.base }
				highlights.DiagnosticHintSign = { fg = colors.magenta.base }
				highlights.DiagnosticUnderlineError = { undercurl = false }
				highlights.DiagnosticUnderlineHint = { fg = colors.magenta.base, undercurl = false }
				highlights.DiagnosticUnderlineInfo = { fg = colors.cyan.base, undercurl = false }
				highlights.DiagnosticUnderlineOK = { fg = colors.green.base, undercurl = false }
				highlights.DiagnosticUnderlineWarn = { fg = colors.yellow.base, undercurl = false }
				highlights.MatchParen = { fg = colors.yellow.base, underline = false, bold = false }
			end,

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
