require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd", "injected" },
		sql = { "sleek" },
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
	require("conform").format({ async = true, lsp_fallback = true, range = range })
	require("conform.formatters.injected").options.ignore_errors = false
end, { range = true })
