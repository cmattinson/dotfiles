return {
	"echasnovski/mini.nvim",
	version = false,
	lazy = true,
	event = "BufEnter",
	config = function()
		require("mini.jump").setup()
		require("mini.move").setup()
		require("mini.surround").setup()
		require("mini.ai").setup()
	end,
}
