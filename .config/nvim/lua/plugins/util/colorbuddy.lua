return {
	"tjdevries/colorbuddy.nvim",
	lazy = false,
	priority = 10000,
	enabled = false,
	config = function()
		vim.cmd.colorscheme("gruvbuddy")
	end,
}
