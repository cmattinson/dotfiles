return {
	"comfysage/evergarden",
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function()
		local colors = require("evergarden.colors")

		require("evergarden").setup({
			transparent_background = true,
			contrast_dark = "medium", -- 'hard'|'medium'|'soft'
			override_terminal = true,
			style = {
				tabline = { reverse = true, color = "green" },
				search = { reverse = false, inc_reverse = true },
				types = { italic = false },
				keyword = { italic = false },
				comment = { italic = false },
			},
			overrides = {
				DiagnosticUnderlineError = { underline = false },
				DiagnosticUnderlineHint = { underline = false },
				DiagnosticUnderlineInfo = { underline = false },
				DiagnosticUnderlineOK = { underline = false },
				DiagnosticUnderlineWarn = { fg = colors.yellow, underline = false },
			}, -- add custom overrides
		})

		vim.cmd("colorscheme evergarden")
	end,
}
