return {
	"stevearc/conform.nvim",
	lazy = true,
	event = "BufEnter",
	priority = 100,
	config = function()
		require("conform").setup({
			log_level = vim.log.levels.ERROR,
			formatters = {
				fantomas = {
					command = "dotnet",
					args = { "fantomas", "." },
				},
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
				moon = {
					inherit = false,
					command = "moon",
					stdin = false,
					args = { "fmt", "$FILENAME", "--block-style", "false" },
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
				elixir = { "mix" },
				elm = { "elm_format" },
				fsharp = { "fantomas" },
				gleam = { "gleam" },
				go = { "gofmt" },
				haskell = { "fourmolu" },
				html = { "htmlbeautifier" },
				java = { "google-java-format" },
				javascript = { "biome", "injected" },
				javascriptreact = { "biome", "injected" },
				json = { "biome" },
				kotlin = { "ktfmt" },
				lua = { "stylua" },
				moonbit = { "moon" },
				ocaml = { "ocamlformat" },
				odin = { "odinfmt" },
				php = { "pint" },
				purescript = { "purs-tidy" },
				python = { "black" },
				reason = { "refmt" },
				rescript = { "rescript" },
				rust = { "rustfmt" },
				sql = { "sql_formatter" },
				swift = { "swift" },
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
