vim.api.nvim_create_user_command("SortColumms", function()
	vim.cmd([[sort /\/[A-z]/]])
end, {})
