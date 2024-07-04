return {
	"projekt0n/github-nvim-theme",
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function()
		-- Default options
		require("github-theme").setup({
			options = {
				-- Compiled file's destination location
				compile_path = vim.fn.stdpath("cache") .. "/github-theme",
				compile_file_suffix = "_compiled",
				hide_end_of_buffer = true,
				hide_nc_statusline = true,
				transparent = true,
				terminal_colors = true,
				dim_inactive = false,
				module_default = true,
				styles = {
					comments = "NONE",
					functions = "NONE",
					keywords = "NONE",
					variables = "NONE",
					conditionals = "NONE",
					constants = "NONE",
					numbers = "NONE",
					operators = "NONE",
					strings = "NONE",
					types = "NONE",
				},
				inverse = {
					match_paren = false,
					visual = false,
					search = false,
				},
				darken = {
					floats = false,
					sidebars = {
						enabled = false,
						list = {},
					},
				},
				modules = {},
			},
			palettes = {},
			specs = {},
			groups = {},
		})

		vim.cmd("colorscheme github_dark_tritanopia")
	end,
}
