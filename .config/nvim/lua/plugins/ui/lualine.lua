return {
	"nvim-lualine/lualine.nvim",
	lazy = true,
	event = "BufEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
				always_divide_middle = false,
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "", right = "" } } },
				lualine_b = {
					"branch",
					"diff",
					"diagnostics",
				},
				lualine_c = {
					"filename",
				},
				lualine_x = {
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
		require("nvim-web-devicons").setup({
			override_by_extension = {
				["dune"] = {
					icon = "",
					color = "#ffffff",
					name = "dune",
				},
				["gleam"] = {
					icon = "󰦥",
					color = "#ffaff3",
					name = "gleam",
				},
				["purs"] = {
					icon = "",
					color = "#eeffff",
					name = "purescript",
				},
				["odin"] = {
					icon = "Ø",
					color = "#1E4677",
					name = "odin",
				},
				["mbt"] = {
					icon = "🌙",
					color = "#791f54",
					name = "moonbit",
				},
			},
		})
	end,
}
