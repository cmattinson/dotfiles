return {
	"terrortylor/nvim-comment",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	lazy = true,
	event = "BufEnter",
	config = function()
		require("nvim_comment").setup({
			comment_empty = false,
			hook = function()
				require("ts_context_commentstring.internal").update_commentstring()
			end,
		})

		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})

		vim.g.skip_ts_context_commentstring_module = true
		vim.keymap.set("n", "<C-/>", vim.cmd.CommentToggle)
		vim.cmd("vnoremap <C-/> :CommentToggle<CR>")
	end,
}
