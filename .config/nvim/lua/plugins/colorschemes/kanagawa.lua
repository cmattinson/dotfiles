return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function()
		require("kanagawa").setup({
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = false },
			functionStyle = { italic = false },
			keywordStyle = { italic = false },
			statementStyle = { italic = false },
			typeStyle = { italic = false },
			transparent = true,
			dimInactive = false,
			terminalColors = true,
			colors = {
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
			theme = "dragon", -- Load "wave" theme when 'background' option is not set
			background = { -- map the value of 'background' option to a theme
				dark = "dragon", -- try "dragon" !
				light = "lotus",
			},
		})

		vim.cmd("colorscheme kanagawa")
	end,
}
