return {
	"Shatur/neovim-ayu",
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function()
		require("ayu").setup({
			mirage = false,
			terminal = true,
			overrides = {},
		})

		vim.cmd("colorscheme ayu-dark")
	end,
}
