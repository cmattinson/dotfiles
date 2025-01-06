return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	enabled = false,
	lazy = true,
	keys = "<C-b>",
	config = function()
		vim.opt.termguicolors = true

		vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle)

		require("nvim-tree").setup({
			view = {
				side = "right",
			},
		})
	end,
}
