return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function() -- Default options
		require("nightfox").setup({
			options = {
				compile_path = vim.fn.stdpath("cache") .. "/nightfox",
				compile_file_suffix = "_compiled",
				transparent = true,
				terminal_colors = true,
				dim_inactive = false,
				module_default = true,
				colorblind = {
					enable = false,
					simulate_only = false,
					severity = {
						protan = 0, -- Severity [0,1] for protan (red)
						deutan = 0, -- Severity [0,1] for deutan (green)
						tritan = 0, -- Severity [0,1] for tritan (blue)
					},
				},
				styles = {
					comments = "NONE",
					conditionals = "NONE",
					constants = "NONE",
					functions = "NONE",
					keywords = "NONE",
					numbers = "NONE",
					operators = "NONE",
					strings = "NONE",
					types = "NONE",
					variables = "NONE",
				},
				inverse = {
					match_paren = false,
					visual = false,
					search = false,
				},
				modules = {},
			},
			palettes = {},
			specs = {},
			groups = {},
		})

		-- setup must be called before loading
		vim.cmd("colorscheme nightfox")
	end,
}
