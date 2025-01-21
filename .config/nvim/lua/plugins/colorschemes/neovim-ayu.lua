return {
	"Shatur/neovim-ayu",
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function()
		local colors = {
			blue = "#39bae6",
			green = "#aad94c",
			yellow = "#ffb454",
			orange = "#ff8f40",
			red = "#d95757",
			purple = "#d2a644",
		}

		require("ayu").setup({
			mirage = false,
			terminal = true,
			overrides = {
				DiagnosticUnderlineError = { undercurl = false },
				DiagnosticUnderlineHint = { undercurl = false },
				DiagnosticUnderlineInfo = { undercurl = false },
				DiagnosticUnderlineOK = { undercurl = false },
				DiagnosticUnderlineWarn = { undercurl = false },
				Function = { fg = colors.blue },
				MatchParen = { fg = colors.orange, bold = true, underline = false },
				MiniJump2dSpot = { underline = false },
				["@keyword.exception"] = { fg = colors.red },
			},
		})

		vim.cmd("colorscheme ayu-dark")
	end,
}
