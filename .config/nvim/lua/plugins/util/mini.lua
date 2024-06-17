return {
	"echasnovski/mini.nvim",
	version = false,
	lazy = false,
	config = function()
		-- Editing
		require("mini.jump").setup()
		require("mini.move").setup()
		require("mini.surround").setup()
		require("mini.ai").setup()
	end,
}
