return {
	"metalelf0/kintsugi-nvim",
	event = "ColorScheme",
	priority = 1000,
	init = function()
		require("kintsugi").setup({
			variant = "flared",
			transparent = false,
			terminal_colors = true,
			bold_keywords = true,
			italic_comments = false,
		})
	end,
}
