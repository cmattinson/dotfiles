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
			formatters = {
				odinfmt = {
					inherit = false,
					command = "odinfmt",
					args = { "-stdin" },
				},
			},
			formatters_by_ft = {
				cs = { "csharpier" },
				css = { "biome" },
				gleam = { "gleam" },
				go = { "gofmt" },
				html = { "biome" },
				java = { "google-java-format" },
				javascript = { "biome", "injected" },
				javascriptreact = { "biome", "injected" },
				json = { "biome" },
				kotlin = { "ktlint" },
				lua = { "stylua" },
				ocaml = { "ocamlformat" },
				odin = { "odinfmt" },
				python = { "black" },
				rust = { "rustfmt" },
				sql = { "sql-formatter" },
				typescript = { "biome", "injected" },
				yaml = { "yamlfmt" },
				zig = { "zigfmt" },
			},
			notify_on_error = false,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf }, function(err)
					if err ~= nil then
						vim.notify(err, "error")
					end
				end)
			end,
		})
	end,
}
