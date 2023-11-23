return {
	"marko-cerovac/material.nvim",
	lazy = false,
	priority = 10000,
	init = function()
		local colors = require("material.colors")

		require("material").setup({
			contrast = {
				sidebars = true,
				floating_windows = false, -- Enable contrast for floating windows
				cursor_line = false, -- Enable darker background for the cursor line
				non_current_windows = false, -- Enable contrasted background for non-current windows
				filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
			},
			styles = {
				comments = { italic = false },
				strings = { italic = false },
				keywords = { italic = false },
				functions = { italic = false },
				variables = { italic = false },
				operators = { italic = false },
				types = { italic = false },
			},
			plugins = {
				"dap",
				"harpoon",
				"nvim-cmp",
				"nvim-tree",
				"nvim-web-devicons",
				"telescope",
			},
			disable = {
				colored_cursor = true,
				borders = false,
				background = true,
				term_colors = false,
				eob_lines = false,
			},
			lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
			async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
			custom_colors = nil, -- If you want to override the default colors, set this to a function
			custom_highlights = {
				CursorLineNr = { fg = colors.main.cyan },
				["@keyword"] = { fg = colors.main.purple, italic = false },
				["@keyword.coroutine"] = { fg = colors.main.purple, italic = false },
				["@keyword.coroutine.javascript"] = { fg = colors.main.purple, italic = false },
				IncSearch = { underline = false, bg = colors.main.orange, fg = colors.main.black },
				["@parameter"] = { fg = colors.main.red },
				["@property.javascript"] = { fg = colors.main.blue },
				DiagnosticHint = { fg = "#80cbc4" },
				DiagnosticHintSign = { fg = "#80cbc4" },
			},
		})

		vim.g.material_style = "deep ocean"
		vim.cmd("colorscheme material")
	end,
}
