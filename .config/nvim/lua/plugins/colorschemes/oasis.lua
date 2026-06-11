return {
	"uhs-robert/oasis.nvim",
	event = "ColorScheme",
	priority = 1000,
	init = function()
		require("oasis").setup({
			style = "abyss",
			palette_overrides = {
				oasis_abyss = {},
			},
		})
	end,
}
