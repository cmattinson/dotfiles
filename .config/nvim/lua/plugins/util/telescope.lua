return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	event = "VimEnter",
	dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-args.nvim" } },
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules", "tests" },
				path_display = { "truncate" },
				{
					mappings = {
						i = {
							["<C-q>"] = require("trouble.sources.telescope").open,
						},
					},
				},
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = { width = { size = 0.999, padding = 0 }, height = { size = 0.999, padding = 0 } },
				},
				"--multiline",
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		})

		require("telescope").load_extension("live_grep_args")

		vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
		vim.keymap.set("n", "<C-p>", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set(
			"n",
			"<leader>sw",
			require("telescope.builtin").grep_string,
			{ desc = "[S]earch current [W]ord" }
		)
		vim.keymap.set(
			"n",
			"<C-f>",
			require("telescope").extensions.live_grep_args.live_grep_args,
			{ desc = "[S]earch by [G]rep" }
		)
		vim.keymap.set("n", "<leader>ht", ":Telescope help_tags<CR>")
		vim.keymap.set("n", "<leader>hl", ":Telescope highlights<CR>")
		vim.keymap.set("n", "<leader>co", ":Telescope colorscheme<CR>")
	end,
}
