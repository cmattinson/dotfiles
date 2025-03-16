return {
	"williamboman/mason.nvim",
	lazy = false,
	priority = 500,
	config = function()
		require("mason").setup()
	end,
}
