local get_hex = require("cokeline/utils").get_hex

require("cokeline").setup({
	show_if_buffers_are_at_least = 2,
	buffers = {
		new_buffers_position = "number",
	},
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and get_hex("ModeMsg", "fg") or get_hex("Comment", "fg")
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
				return buffer.filename .. "  "
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
