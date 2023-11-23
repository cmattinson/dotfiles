return {
	"stevearc/conform.nvim",
	lazy = true,
	event = "BufWritePre",
	priority = 100,
	config = function()
		function split(s, sep)
			local fields = {}

			local sep = sep or " "
			local pattern = string.format("([^%s]+)", sep)
			string.gsub(s, pattern, function(c)
				fields[#fields + 1] = c
			end)

			return fields
		end

		require("conform").setup({
			log_level = vim.log.levels.ERROR,
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
			notify_on_error = false,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf }, function(err)
					if err ~= nil then
						vim.notify(err, "error")
						-- if string.find(string.lower(err), "prettier") then
						-- 	vim.notify(err, "error")
						-- else
						-- 	local fields = split(err, ":")
						-- 	for k, v in pairs(fields) do
						-- 		print(v)
						-- 		if
						-- 			string.find(string.lower(v), "expected")
						-- 			or string.find(string.lower(v), "unexpected")
						-- 			or string.find(string.lower(v), "token")
						-- 		then
						-- 			vim.notify(v, "error", {
						-- 				title = "Format errors",
						-- 				timeout = 10000,
						-- 			})
						-- 		end
						-- 	end
						-- end
					end
				end)
			end,
		})
	end,
}
