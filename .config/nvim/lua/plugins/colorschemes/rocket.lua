return {
	dir = "~/workspace/lua/rocket-theme.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function()
		vim.cmd("colorscheme rocket")
	end,
}
