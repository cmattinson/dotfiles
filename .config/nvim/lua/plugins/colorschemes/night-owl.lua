return {
	"oxfist/night-owl.nvim",
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function()
		require("night-owl").setup({
			bold = false,
			italics = false,
			underline = false,
			undercurl = false,
			transparent_background = true,
		})
	end,
}
