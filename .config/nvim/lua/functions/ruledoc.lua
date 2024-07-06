vim.api.nvim_create_user_command("RuleDoc", function()
	vim.cmd(
		[[s/\(.*\).prototype.\(.*\) = \(.*\)/\/**\r* @openapi\r* \/api\/\l\1\/\2:\r*   get:\r*     tags: [\1]\r*\/\r\1.prototype.\2 = \3]]
	)
	vim.cmd("w")
end, {})
