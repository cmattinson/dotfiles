local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<C-p>", ":Telescope find_files<CR>")
map("n", "<leader>g", ":Telescope git_files<CR>")
map("n", "<C-f>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
map("n", "<leader>tb", ":Telescope buffers<CR>")
map("n", "<leader>df", ":lua dotfiles()<CR>")

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules", "tests" },
		{ mappings = {
			i = {
				["<C-q>"] = actions.smart_add_to_qflist,
			},
		} },
		"--multiline",
	},
})

require("telescope").load_extension("dap")
