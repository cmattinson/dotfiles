require("bufferline").setup({
	options = {
		mode = "buffers",
		numbers = "none",
		always_show_bufferline = false,
		offsets = {
			{
				filetype = "NvimTree",
				text = "NvimTree",
				highlight = "Directory",
				separator = "|",
			},
		},
		separator_style = { '|', '|' },
        show_buffer_close_icons = false,
        show_close_icon = false
	},
	highlights = {
		buffer_selected = { italic = false },
		numbers_selected = { italic = false },
		pick_visible = { italic = false },
		pick = { italic = false },
		pick_selected = { italic = false },
	},
})
