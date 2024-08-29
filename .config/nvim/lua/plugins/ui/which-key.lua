return {
	"folke/which-key.nvim",
	lazy = true,
	event = "VimEnter",
	config = function()
		require("which-key").setup()
	end,
}
