require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules" },
		{ mappings = {
			i = {
				["<C-q>"] = require("telescope.actions").smart_add_to_qflist,
			},
		} },
	},
})
