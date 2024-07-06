return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local neogit = require("neogit")

		vim.keymap.set("n", "<leader>g", vim.cmd.Neogit)
		vim.keymap.set("n", "<leader>do", vim.cmd.DiffviewOpen)
		vim.keymap.set("n", "<leader>dc", vim.cmd.DiffviewClose)

		neogit.setup()
	end,
}
