return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	keys = "<leader>lg",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>lg", vim.cmd.LazyGit)
	end,
}
