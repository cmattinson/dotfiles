return {
	"marko-cerovac/material.nvim",
	lazy = false,
	priority = 10000,
	enabled = true,
	init = function()
		local colors = require("material.colors")

		local language_config = {
			javascript = {
				["@keyword.coroutine.javascript"] = { fg = colors.main.purple, italic = false },
				["@property.javascript"] = { fg = colors.main.blue },
				["@tag.builtin.javascript"] = { fg = colors.main.red },
				["@type.javascript"] = { fg = colors.main.yellow },
				["@punctuation.delimiter.jsdoc"] = { link = "Comment" },
				["@variable.jsdoc"] = { link = "Comment" },
				["@type.jsdoc"] = { fg = colors.main.yellow },
			},
			gleam = {
				["@type.gleam"] = { fg = colors.main.yellow },
			},
			ocaml = {
				["@constructor.ocaml"] = { fg = colors.main.yellow },
				["@type.ocaml"] = { fg = colors.main.yellow },
			},
			python = {
				["@string.documentation.python"] = { link = "Comment" },
			},
			rescript = {
				["@constant.builtin.rescript"] = { fg = colors.main.orange },
				["@error.rescript"] = { bold = false },
				["@warning.rescript"] = { bold = false },
			},
			zig = {
				["@field.zig"] = { fg = colors.main.blue },
			},
		}

		local highlight_config = {
			CursorLine = { link = "ColorColumn" },
			DiagnosticUnderlineError = { undercurl = false },
			DiagnosticUnderlineHint = { undercurl = false },
			DiagnosticUnderlineInfo = { undercurl = false },
			DiagnosticUnderlineOK = { undercurl = false },
			DiagnosticUnderlineWarn = { undercurl = false },
			DiagnosticUnnecessary = { link = "Normal" },
			Comment = { fg = colors.main.orange },
			CursorLineNr = { fg = colors.main.yellow },
			Exception = { fg = colors.main.red },
			Function = { fg = colors.main.darkblue },
			Identifier = { link = "Normal" },
			IncSearch = { underline = false, bg = colors.main.orange, fg = colors.main.black },
			MiniIndentScopeSymbol = { fg = colors.main.cyan },
			MiniJump = { link = "@symbol" },
			NeogitDiffAddHighlight = { fg = colors.main.green },
			NeogitPopupSwitchDisabled = { link = "Conceal" },
			NeogitPopupSwitchEnabled = { fg = colors.main.red },
			Search = { underline = false, bg = colors.main.purple, fg = colors.main.black },
			SpecialChar = { link = "Cyan" },
			TelescopeNormal = { link = "Normal" },
			WhichKeyDesc = { italic = false },
			["@annotation"] = { fg = colors.main.blue },
			["@comment.documentation"] = { link = "Comment" },
			["@constant"] = { fg = colors.main.darkyellow },
			["@keyword"] = { fg = colors.main.purple, italic = false },
			["@keyword.coroutine"] = { fg = colors.main.purple, italic = false },
			["@lsp.type.string"] = { fg = colors.main.yellow },
			["@markup.heading"] = { bold = false },
			["@type.builtin"] = { fg = colors.main.yellow },
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
			custom_highlights = vim.tbl_deep_extend(
				"force",
				highlight_config,
				language_config.ocaml,
				language_config.javascript,
				language_config.python
			),
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
