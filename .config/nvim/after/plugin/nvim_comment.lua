require("nvim_comment").setup({
	comment_empty = false,
	hook = function()
		require("ts_context_commentstring.internal").update_commentstring()
	end,
})

vim.keymap.set("n", "<C-/>", vim.cmd.CommentToggle)
vim.cmd("vnoremap <C-/> :CommentToggle<CR>")
