require("conform").setup({
	log_level = vim.log.levels.NONE,
	formatters_by_ft = {
		css = { "prettier" },
		go = { "gofmt" },
		html = { "prettier" },
		javascript = { "prettier", "injected" },
		javascriptreact = { "prettier", "injected" },
		json = { "prettier" },
		lua = { "stylua" },
		rust = { "rustfmt" },
		sql = { "sleek" },
		yaml = { "yamlfmt" },
	},
	formatters = {
		sleek = {
			command = "sleek",
		},
	},
})

vim.api.nvim_create_user_command("Conform", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = true, range = range }, function(err)
		if err ~= nil then
			vim.api.nvim_echo({ { vim.inspect(err) } }, true, {})
		end
	end)
end, { range = true })

vim.keymap.set("n", "<leader>p", vim.cmd.Conform)
