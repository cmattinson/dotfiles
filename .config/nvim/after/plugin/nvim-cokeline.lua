local get_hl = require("cokeline.hlgroups").get_hl_attr

vim.keymap.set("n", "<C-Left>", "<Plug>(cokeline-switch-prev)", { silent = true })
vim.keymap.set("n", "<C-Right>", "<Plug>(cokeline-switch-next)", { silent = true })

require("cokeline").setup({
	show_if_buffers_are_at_least = 2,
	buffers = {
		new_buffers_position = "number",
	},
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and get_hl("Directory", "fg") or get_hl("Comment", "fg")
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
				return buffer.unique_prefix .. buffer.filename .. "  "
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
})
