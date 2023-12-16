return {
	"RRethy/nvim-base16",
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function()
		require("base16-colorscheme").with_config({
			telescope = true,
			cmp = true,
		})

		vim.cmd("colorscheme base16-tomorrow-night")
	end,
}
