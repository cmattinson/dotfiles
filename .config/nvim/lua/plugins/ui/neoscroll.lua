return {
	"karb94/neoscroll.nvim",
	lazy = true,
	event = "BufEnter",
	config = function()
		local neoscroll = require("neoscroll")

		neoscroll.setup({
			mappings = {},
			hide_cursor = false,
			easing = "quadratic",
		})

		local keymap = {
			["<C-u>"] = function()
				neoscroll.ctrl_u({ duration = 150, easing = "quadratic" })
			end,
			["<C-d>"] = function()
				neoscroll.ctrl_d({ duration = 150, easing = "quadratic" })
			end,
		}

		local modes = { "n", "v", "x" }
		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end
	end,
}
