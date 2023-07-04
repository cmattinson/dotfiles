-- Default options
require("github-theme").setup({
	options = {
		transparent = true, -- Disable setting background
	},
	palettes = {},
	specs = {},
	groups = {},
})

-- setup must be called before loading
vim.cmd("colorscheme github_dark_tritanopia")
