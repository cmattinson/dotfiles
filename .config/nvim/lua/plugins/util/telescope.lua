return {
	"nvim-telescope/telescope.nvim",
	dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-args.nvim" } },
	config = function()
		local actions = require("telescope.actions")
		local pickers = require("telescope.pickers")
		local finders = require("telescope.finders")
		local conf = require("telescope.config").values
		local trouble = require("trouble.providers.telescope")

		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules", "tests" },
				path_display = { "truncate" },
				{ mappings = {
					i = {
						["<C-q>"] = trouble.open_with_trouble,
					},
				} },
				"--multiline",
			},
		})

		vim.keymap.set("n", "<leader>g", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
		vim.keymap.set("n", "<C-p>", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set(
			"n",
			"<leader>sw",
			require("telescope.builtin").grep_string,
			{ desc = "[S]earch current [W]ord" }
		)
		vim.keymap.set("n", "<C-f>", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>ht", ":Telescope help_tags<CR>")
		vim.keymap.set("n", "<leader>hl", ":Telescope highlights<CR>")
	end,
}
