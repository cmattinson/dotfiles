vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.mbt",
	desc = "Detect and set the proper file type for Moonbit files",
	callback = function()
		vim.cmd("set filetype=moonbit")
	end,
})
