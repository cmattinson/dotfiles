return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-dap.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node_modules" },
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
				find_files = {
					previewer = false,
				},
			},
		})

		telescope.load_extension("dap")
		telescope.load_extension("live_grep_args")

		vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search git files" })
		vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Search files" })
		vim.keymap.set("n", "<leader>ht", builtin.help_tags, { desc = "Search help" })
		vim.keymap.set("n", "<leader>hl", builtin.highlights, { desc = "Search highlight groups" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current word" })
		vim.keymap.set("n", "<leader>co", builtin.colorscheme, { desc = "Search colorschemes" })
		vim.keymap.set("n", "<C-f>", telescope.extensions.live_grep_args.live_grep_args, { desc = "Search by grep" })
		vim.keymap.set("n", "<C-b>", builtin.buffers, { desc = "Search open buffers" })
	end,
}
