return {
	"marko-cerovac/material.nvim",
	lazy = false,
	priority = 10000,
	enabled = true,
	init = function()
		local colors = require("material.colors")

		require("material").setup({
			async_loading = true,
			contrast = {
				sidebars = true,
				floating_windows = true,
				cursor_line = false,
				non_current_windows = false,
				filetypes = {},
			},
			custom_colors = nil,
			custom_highlights = {
				CursorLine = { link = "ColorColumn" },
				CursorLineNr = { fg = colors.main.yellow },
				DiagnosticHint = { fg = colors.main.purple },
				DiagnosticHintSign = { fg = colors.main.purple },
				DiagnosticUnderlineError = { undercurl = false },
				DiagnosticUnderlineHint = { fg = colors.main.darkpurple, undercurl = false },
				DiagnosticUnderlineInfo = { fg = colors.main.paleblue, undercurl = false },
				DiagnosticUnderlineOK = { fg = colors.main.darkgreen, undercurl = false },
				DiagnosticUnderlineWarn = { fg = colors.main.darkyellow, undercurl = false },
				Exception = { fg = colors.main.red },
				IncSearch = { underline = false, bg = colors.main.orange, fg = colors.main.black },
				Search = { underline = false, bg = colors.main.purple, fg = colors.main.black },
				WhichKeyDesc = { italic = false },
				MiniJump = { link = "@symbol" },
				["@field.zig"] = { fg = colors.main.blue },
				["@keyword"] = { fg = colors.main.purple, italic = false },
				["@keyword.coroutine"] = { fg = colors.main.purple, italic = false },
				["@keyword.coroutine.javascript"] = { fg = colors.main.purple, italic = false },
				["@parameter"] = { fg = colors.main.red },
				["@property.javascript"] = { fg = colors.main.blue },
				["@type.jsdoc"] = { fg = colors.main.yellow },
				["zig"] = { fg = colors.main.blue },
			},
			disable = {
				background = true,
				borders = false,
				colored_cursor = false,
				eob_lines = false,
				term_colors = false,
			},
			lualine_style = "stealth",
			plugins = {
				"dap",
				"fidget",
				"mini",
				"nvim-cmp",
				"nvim-tree",
				"nvim-web-devicons",
				"telescope",
				"which-key",
			},
			styles = {
				comments = { italic = false },
				functions = { italic = false },
				keywords = { italic = false },
				operators = { italic = false },
				strings = { italic = false },
				types = { italic = false },
				variables = { italic = false },
			},
		})

		vim.g.material_style = "deep ocean"
		vim.cmd("colorscheme material")
	end,
}
