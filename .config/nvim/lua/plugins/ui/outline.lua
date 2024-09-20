return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{ "<A-o>", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		outline_window = {
			width = 15,
		},
	},
}
