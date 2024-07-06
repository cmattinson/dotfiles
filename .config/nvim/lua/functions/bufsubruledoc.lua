vim.api.nvim_create_user_command("BufSubRuleDoc", function()
	vim.cmd(
		[[bufdo s/\(.*\).prototype.\(.*\)\.\(.*\) = \(.*\)/\/**\r* @openapi\r* \/api\/\l\1\/\2\/\3:\r*   get:\r*     tags: [\1]\r*\/\r\1.prototype.\2.\3 = \4]]
	)
	vim.cmd("w")
end, {})
