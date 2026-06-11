return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	enabled = true,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"moonbit-community/moonbit.nvim",
	},
	---@type snacks.Config
	opts = {
		bigfile = { enabled = false },
		dashboard = { enabled = false },
		explorer = { enabled = false },
		indent = { enabled = false },
		input = { enabled = false },
		image = { enabled = true },
		notifier = {
			enabled = false,
			timeout = 3000,
		},
		picker = {
			layout = {
				layout = {
					box = "horizontal",
					width = 0.99,
					height = 0.99,
					{
						box = "vertical",
						border = "rounded",
						title = "{title} {live} {flags}",
						{ win = "list", border = "none" },
						{ win = "input", height = 1, border = "top" },
					},
					{ win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
				},
			},
		},
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
		styles = {
			notification = {},
		},
	},
	keys = {
		-- Top Pickers & Explorer
		{
			"<C-b>",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<C-f>",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<C-p>",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>cm",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>hl",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			"<leader>kb",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>co",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		{
			"<leader>ht",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		-- Other
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
		{
			"<leader>Z",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Toggle Zoom",
		},
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>cR",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<c-_>",
			function()
				Snacks.terminal()
			end,
			desc = "which_key_ignore",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
		{
			"<leader>N",
			desc = "Neovim News",
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0.6,
					height = 0.6,
					wo = {
						spell = false,
						wrap = false,
						signcolumn = "yes",
						statuscolumn = " ",
						conceallevel = 3,
					},
				})
			end,
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd
			end,
		})
	end,
}
