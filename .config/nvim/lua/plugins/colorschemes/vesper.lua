return {
	"datsfilipe/vesper.nvim",
	event = "ColorScheme",
	priority = 1000,
	init = function()
		require("vesper").setup({
			transparent = false,
			italics = {
				comments = false,
				keywords = false,
				functions = false,
				strings = false,
				variables = false,
			},
			overrides = {},
			palette_overrides = {},
		})

	end,
}
