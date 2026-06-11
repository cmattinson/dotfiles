return {
	"marko-cerovac/material.nvim",
	lazy = false,
	priority = 10000,
	enabled = true,
	init = function()
		local colors = require("material.colors")

		local material_style = "deep ocean"
		local common_config = {
			DiagnosticUnderlineError = {},
			DiagnosticUnderlineHint = {},
			DiagnosticUnderlineInfo = {},
			DiagnosticUnderlineOK = {},
			DiagnosticUnderlineWarn = {},
			DiagnosticUnnecessary = {},
			Underlined = {},
			WinBar = { link = "Normal" },
			WinBarHl = { fg = colors.main.cyan },
			WinBarNC = { link = "Normal" },
		}

		local lighter_config = {
			Comment = { fg = colors.main.darkorange },
			Cursor = { fg = colors.main.white, bg = colors.main.yellow },
			IncSearch = { fg = colors.main.white, bg = colors.main.cyan },
		}

		local deep_ocean_config = {
			CursorLine = { link = "ColorColumn" },
			Comment = { fg = colors.main.orange },
			CursorLineNr = { fg = colors.main.yellow },
			Error = { bold = false },
			Exception = { fg = colors.main.red },
			FloatBorder = { fg = colors.main.cyan },
			Function = { fg = colors.main.darkblue },
			Identifier = { link = "Normal" },
			IncSearch = { underline = false, bg = colors.main.orange, fg = colors.main.black },
			LspCodeLens = { fg = colors.main.orange },
			MiniIndentScopeSymbol = { fg = colors.main.cyan },
			MiniJump = { link = "@symbol" },
			NeogitDiffAddHighlight = { fg = colors.main.green },
			NeogitPopupSwitchDisabled = { link = "Conceal" },
			NeogitPopupSwitchEnabled = { fg = colors.main.red },
			Search = { underline = false, bg = colors.main.purple, fg = colors.main.black },
			SpecialChar = { link = "Cyan" },
			TelescopeNormal = { link = "Normal" },
			WhichKeyDesc = { italic = false },
			VertSplit = { fg = colors.main.white },
			["@annotation"] = { fg = colors.main.blue },
			["@comment.documentation"] = { link = "Comment" },
			["@keyword"] = { fg = colors.main.purple, italic = false },
			["@keyword.coroutine"] = { fg = colors.main.purple, italic = false },
			["@lsp.type.string"] = { fg = colors.main.yellow },
			["@markup.heading"] = { bold = false },
			["@type.builtin"] = { fg = colors.main.yellow },
			["@type"] = { fg = colors.main.yellow },
			-- Javascript
			["@keyword.coroutine.javascript"] = { fg = colors.main.purple, italic = false },
			["@property.javascript"] = { fg = colors.main.blue },
			["@tag.builtin.javascript"] = { fg = colors.main.red },
			["@type.javascript"] = { fg = colors.main.yellow },
			["@punctuation.delimiter.jsdoc"] = { link = "Comment" },
			["@variable.jsdoc"] = { link = "Comment" },
			["@type.jsdoc"] = { fg = colors.main.yellow },
			-- Gleam
			["@type.gleam"] = { fg = colors.main.yellow },
			["@constructor.gleam"] = { fg = colors.main.yellow },
			-- Moonbit
			["@type.definition.moonbit"] = { fg = colors.main.yellow },
			-- OCaml
			["@constructor.ocaml"] = { fg = colors.main.yellow },
			["@type.ocaml"] = { fg = colors.main.yellow },
			["@attribute.ocaml"] = { link = "Normal" },
			-- Odin
			["@type.odin"] = { fg = colors.main.yellow },
			["@module.odin"] = { fg = colors.main.purple },
			-- Python
			["@string.documentation.python"] = { link = "Comment" },
			--- PureScript
			["@constructor.purescript"] = { fg = colors.main.yellow },
			-- ReScript
			["@constant.builtin.rescript"] = { fg = colors.main.orange },
			["@error.rescript"] = { bold = false },
			["@warning.rescript"] = { bold = false },
			["@constructor.rescript"] = { fg = colors.main.yellow },
			-- TypeScript
			["@type.typescript"] = { fg = colors.main.yellow },
			["@module.typescript"] = { fg = colors.main.purple },
			["@tag.builtin.tsx"] = { fg = colors.main.red },
			-- Zig
			["@type.zig"] = { fg = colors.main.yellow },
			["@field.zig"] = { fg = colors.main.blue },
		}

		require("material").setup({
			async_loading = true,
			contrast = {
				sidebars = true,
				floating_windows = true,
				cursor_line = true,
				non_current_windows = true,
				filetypes = {},
			},
			custom_colors = function(cl)
				cl.main.muted = "#8f93a2"
			end,
			custom_highlights = function()
				if material_style == "lighter" then
					vim.print(material_style)
					return vim.tbl_deep_extend("force", common_config, lighter_config)
				end

				if material_style == "deep ocean" then
					return vim.tbl_deep_extend("force", common_config, deep_ocean_config)
				end
			end,
			disable = {
				background = true,
				borders = false,
				colored_cursor = false,
				eob_lines = false,
				term_colors = false,
			},
			high_visibility = {
				lighter = true,
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

		vim.g.material_style = material_style
	end,
}
