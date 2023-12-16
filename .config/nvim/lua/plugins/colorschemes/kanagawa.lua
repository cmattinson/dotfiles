return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function() -- Default options:
		require("kanagawa").setup({
			compile = true,
			undercurl = false,
			commentStyle = { italic = false },
			functionStyle = { italic = false },
			keywordStyle = { italic = false },
			statementStyle = { italic = false },
			typeStyle = { italic = false },
			transparent = true, -- do not set background color
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = { -- add/modify theme and palette colors
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
			theme = "dragon",
		})

		vim.cmd("colorscheme kanagawa")
	end,
}
