return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{ "<A-o>", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		outline_window = {
			position = "left",
			width = 15,
		},
		outline_items = {
			show_symbol_details = true,
		},
	},
}
