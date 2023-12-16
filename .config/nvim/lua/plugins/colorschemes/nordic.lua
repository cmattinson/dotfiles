return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	enabled = false,
	config = function()
		require("nordic").setup({
			bold_keywords = false,
			italic_comments = false,
			transparent_bg = true,
			bright_border = false,
			reduced_blue = true,
			swap_backgrounds = false,
			override = {
				["@parameter"] = {
					italic = false,
					fg = "#bf616a",
				},
				-- DiagnosticVirtualTextWarning = {
				-- 	bg = "NONE",
				-- },
				-- DiagnosticVirtualTextWarn = {
				-- 	bg = "NONE",
				-- },
				-- DiagnosticVirtualTextHint = {
				-- 	bg = "NONE",
				-- },
				-- DiagnosticVirtualTextInfo = {
				-- 	bg = "NONE",
				-- },
				-- DiagnosticVirtualTextError = {
				-- 	bg = "NONE",
				-- },
				CursorLine = {
					bg = "NONE",
				},
				MatchParen = {
					fg = "#ebcd8b",
					underline = false,
					bold = false,
				},
			},
			cursorline = {
				bold_number = true,
			},
			telescope = {
				style = "flat",
			},
			ts_context = {
				dark_background = true,
			},
		})

		require("nordic").load()
	end,
}
