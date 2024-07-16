return {
	"marko-cerovac/material.nvim",
	lazy = false,
	priority = 10000,
	enabled = true,
	init = function()
		local colors = require("material.colors")

		local highlight_config = {
			common = {
				CursorLine = { link = "ColorColumn" },
				DiagnosticUnderlineError = { undercurl = false },
				DiagnosticUnderlineHint = { undercurl = false },
				DiagnosticUnderlineInfo = { undercurl = false },
				DiagnosticUnderlineOK = { undercurl = false },
				DiagnosticUnderlineWarn = { fg = colors.main.yellow, undercurl = false },
			},
			deep_ocean = {
				Comment = { fg = colors.main.orange },
				CursorLineNr = { fg = colors.main.yellow },
				Exception = { fg = colors.main.red },
				Function = { fg = colors.main.darkblue },
				Identifier = { link = "Normal" },
				IncSearch = { underline = false, bg = colors.main.orange, fg = colors.main.black },
				MiniJump = { link = "@symbol" },
				NeogitDiffAddHighlight = { fg = colors.main.green },
				NeogitPopupSwitchDisabled = { link = "Conceal" },
				NeogitPopupSwitchEnabled = { fg = colors.main.red },
				Search = { underline = false, bg = colors.main.purple, fg = colors.main.black },
				TelescopeNormal = { link = "Normal" },
				WhichKeyDesc = { italic = false },
				["@comment.documentation"] = { link = "Comment" },
				["@constant"] = { fg = colors.main.darkyellow },
				["@constructor.ocaml"] = { fg = colors.main.yellow },
				["@field.zig"] = { fg = colors.main.blue },
				["@keyword"] = { fg = colors.main.purple, italic = false },
				["@keyword.coroutine"] = { fg = colors.main.purple, italic = false },
				["@keyword.coroutine.javascript"] = { fg = colors.main.purple, italic = false },
				["@lsp.type.string"] = { fg = colors.main.yellow },
				["@parameter"] = { fg = colors.main.red },
				["@property.javascript"] = { fg = colors.main.blue },
				["@punctuation.delimiter.jsdoc"] = { link = "Comment" },
				["@type.jsdoc"] = { fg = colors.main.yellow },
				["@variable.jsdoc"] = { link = "Comment" },
				["zig"] = { fg = colors.main.blue },
			},
		}

		require("material").setup({
			async_loading = true,
			contrast = {
				sidebars = true,
				floating_windows = true,
				cursor_line = true,
				non_current_windows = false,
				filetypes = {},
			},
			custom_colors = function(cl)
				cl.main.muted = "#8f93a2"
			end,
			custom_highlights = vim.tbl_deep_extend("force", highlight_config.common, highlight_config.deep_ocean),
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
				"neogit",
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
