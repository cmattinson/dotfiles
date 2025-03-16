return {
	"stevearc/conform.nvim",
	lazy = true,
	event = "BufEnter",
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
				rescript = {
					inherit = false,
					command = "rescript",
					args = { "format", "-stdin", ".res" },
				},
				ktfmt = {
					inherit = false,
					command = "ktfmt",
					args = { "--kotlinlang-style", "**/*.kt" },
				},
				sql_formatter = {
					args = { "--config", "/Users/chris/sql-formatter.json" },
				},
				refmt = {
					inherit = false,
					command = "refmt",
					args = {},
				},
			},
			formatters_by_ft = {
				cs = { "csharpier" },
				css = { "biome" },
				elm = { "elm_format" },
				gleam = { "gleam" },
				go = { "gofmt" },
				html = { "htmlbeautifier" },
				java = { "google-java-format" },
				javascript = { "biome", "injected" },
				javascriptreact = { "biome", "injected" },
				json = { "biome" },
				kotlin = { "ktfmt" },
				lua = { "stylua" },
				ocaml = { "ocamlformat" },
				odin = { "odinfmt" },
				php = { "pint" },
				purescript = { "purs-tidy" },
				python = { "black" },
				reason = { "refmt" },
				rescript = { "rescript" },
				rust = { "rustfmt" },
				sql = { "sql_formatter" },
				typescript = { "biome", "injected" },
				typescriptreact = { "biome", "injected" },
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
