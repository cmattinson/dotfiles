return {
	"noib3/nvim-cokeline",
	event = "BufEnter",
	dependencies = { "nvim-tree/nvim-web-devicons", "tiagovla/scope.nvim" },
	enabled = true,
	config = function()
		require("scope").setup({})
		local get_hl = require("cokeline.hlgroups").get_hl_attr

		vim.keymap.set("n", "<leader>p", "<Plug>(cokeline-switch-prev)", { silent = true })
		vim.keymap.set("n", "<leader>n", "<Plug>(cokeline-switch-next)", { silent = true })

		require("cokeline").setup({
			show_if_buffers_are_at_least = 1,
			buffers = {
				new_buffers_position = "number",
			},
			default_hl = {
				fg = function(buffer)
					return buffer.is_focused and get_hl("Normal", "fg") or "#424242"
				end,
				bg = "NONE",
			},
			fill_hl = "NONE",
			sidebar = {
				filetype = "NvimTree",
				components = {
					{
						text = "  ",
					},
				},
			},
			components = {
				{
					text = function(buffer)
						return (buffer.index ~= 1) and " ▏" or ""
					end,
					fg = function(buffer)
						return "#d38aea"
					end,
				},
				{
					text = "  ",
				},
				{
					text = function(buffer)
						return buffer.devicon.icon
					end,
					fg = function(buffer)
						return buffer.devicon.color
					end,
				},
				{
					text = " ",
				},
				{
					text = function(buffer)
						local chunks = {}
						for chunk in string.gmatch(buffer.path, "([^/]+)") do
							table.insert(chunks, chunk)
						end

						return buffer.unique_prefix .. buffer.filename .. " "
					end,
					style = function(buffer)
						return buffer.is_focused and "bold" or nil
					end,
				},
				{
					text = "",
					delete_buffer_on_left_click = true,
				},
				{
					text = "  ",
				},
			},
			tabs = {
				placement = "right",
				components = {},
			},
		})

		require("nvim-web-devicons").setup({
			override_by_extension = {
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
					icon = "󰮔",
					color = "#1E4677",
					name = "odin",
				},
			},
		})
	end,
}
