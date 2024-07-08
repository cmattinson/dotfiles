return {
	"ramojus/mellifluous.nvim",
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function()
		require("mellifluous.config").prepare()
		local cl = require("mellifluous.colors").get_colors()
		local white = require("mellifluous.color").new("#FFFFFF")

		require("mellifluous").setup({
			dim_inactive = false,
			-- mellifluous, alduin, mountain, tender, kanagawa_dragon
			color_set = "mellifluous",
			styles = {
				comments = { italic = false },
				conditionals = { italic = false },
				folds = { italic = false },
				loops = { italic = false },
				functions = { italic = false, fg = cl.red:darkened(15) },
				keywords = { italic = false, fg = cl.blue },
				strings = { italic = false, fg = cl.green:darkened(10) },
				variables = { italic = false, fg = cl.orange },
				numbers = { italic = false },
				booleans = { italic = false },
				properties = { italic = false },
				types = { italic = false },
				operators = { italic = false },
			},
			highlight_overrides = {
				dark = function(highlighter, colors)
					highlighter.set("@variable.member", { fg = colors.ui_orange })
					highlighter.set("@variable.parameter", { fg = white:darkened(30) })
					highlighter.set("CursorLine", { link = "ColorColumn" })
					highlighter.set("DiagnosticError", { fg = colors.red:lightened(20), undercurl = false })
					highlighter.set("DiagnosticHint", { fg = colors.purple:lightened(20), undercurl = false })
					highlighter.set("DiagnosticInfo", { fg = colors.blue:lightened(20), undercurl = false })
					highlighter.set("DiagnosticOK", { fg = colors.green:lightened(20), undercurl = false })
					highlighter.set("DiagnosticWarn", { fg = colors.yellow:lightened(20), undercurl = false })
					highlighter.set("DiagnosticSignError", { fg = colors.red:lightened(20), undercurl = false })
					highlighter.set("DiagnosticSignHint", { fg = colors.purple:lightened(20), undercurl = false })
					highlighter.set("DiagnosticSignInfo", { fg = colors.blue:lightened(20), undercurl = false })
					highlighter.set("DiagnosticSignOK", { fg = colors.green:lightened(20), undercurl = false })
					highlighter.set("DiagnosticSignWarn", { fg = colors.yellow:lightened(20), undercurl = false })
					highlighter.set("DiagnosticUnderlineError", { undercurl = false })
					highlighter.set("DiagnosticUnderlineHint", { fg = colors.purple:lightened(20), undercurl = false })
					highlighter.set("DiagnosticUnderlineInfo", { fg = colors.blue:lightened(20), undercurl = false })
					highlighter.set("DiagnosticUnderlineOK", { fg = colors.green:lightened(20), undercurl = false })
					highlighter.set("DiagnosticUnderlineWarn", { fg = colors.yellow:lightened(20), undercurl = false })
					highlighter.set("DiagnosticVirtualTextError", { fg = colors.red:lightened(20), undercurl = false })
					highlighter.set(
						"DiagnosticVirtualTextHint",
						{ fg = colors.purple:lightened(20), undercurl = false }
					)
					highlighter.set("DiagnosticVirtualTextInfo", { fg = colors.blue:lightened(20), undercurl = false })
					highlighter.set("DiagnosticVirtualTextOK", { fg = colors.green:lightened(20), undercurl = false })
					highlighter.set(
						"DiagnosticVirtualTextWarn",
						{ fg = colors.yellow:lightened(20), undercurl = false }
					)
				end,
			},
			transparent_background = {
				enabled = false,
				floating_windows = true,
				telescope = true,
				file_tree = true,
				cursor_line = true,
				status_line = false,
			},
			flat_background = {
				line_numbers = true,
				floating_windows = false,
				file_tree = false,
				cursor_line_number = false,
			},
			plugins = {
				cmp = true,
				nvim_tree = {
					enabled = false,
					show_root = true,
				},
				telescope = {
					enabled = false,
					nvchad_like = true,
				},
			},
		})

		vim.cmd("colorscheme mellifluous")
	end,
}
