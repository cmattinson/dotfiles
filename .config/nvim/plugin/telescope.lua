local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules", "tests" },
		{ mappings = {
			i = {
				["<C-q>"] = actions.smart_add_to_qflist,
			},
		} },
	},
})
