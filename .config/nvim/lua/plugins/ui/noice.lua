return {
	"folke/noice.nvim",
	enabled = false,
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			presets = {
				long_message_to_split = true,
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				hover = { enabled = false },
				signature = { enabled = false },
			},
			cmdline = {
				view = "cmdline",
				format = {
					search_down = {
						view = "cmdline",
					},
					search_up = {
						view = "cmdline",
					},
				},
			},
			messages = {
				view = "notify",
				view_error = "mini",
				view_history = "messages",
				view_search = "virtualtext",
				view_warn = "notify",
			},
			views = {
				popupmenu = {
					relative = "editor",
					position = {
						row = 8,
						col = "50%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
				mini = {
					backend = "mini",
					relative = "editor",
					align = "message-right",
					timeout = 8000,
					reverse = true,
					focusable = false,
					position = {
						row = -1,
						col = -45,
						-- col = 0,
					},
					size = "auto",
					border = {
						style = "none",
					},
					zindex = 60,
					win_options = {
						winbar = "",
						foldenable = false,
						winblend = 30,
						winhighlight = {
							Normal = "NoiceMini",
							IncSearch = "",
							CurSearch = "",
							Search = "",
						},
					},
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
			},
		})

		require("notify").setup({
			background_colour = "#000000",
		})
	end,
}
