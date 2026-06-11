return {
	"sainnhe/everforest",
	event = "ColorScheme",
	priority = 1000,
	init = function()
		vim.g.everforest_background = "soft"
		vim.g.everforest_better_performance = 1
		vim.g.everforest_transparent_background = 1
		vim.g.everforest_ui_contrast = "low"
		vim.g.everforest_diagnostic_text_highlight = 1
		vim.g.everforest_diagnostic_line_highlight = 0
		vim.g.everforest_diagnostic_virtual_text = "colored"
		vim.g.everforest_spell_foreground = "colored"
		vim.g.everforest_enable_italic = 0
		vim.g.everforest_enable_bold = 0
		vim.g.everforest_show_eob = 0

	end,
}
