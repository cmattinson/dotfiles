return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		"artemave/workspace-diagnostics.nvim",
		"mfussenegger/nvim-lint",
	},
	config = function()
		local blink = require("blink.cmp")
		require("lsp_lines").setup()

		local servers = {
			basedpyright = {},
			biome = {},
			clangd = {},
			cssls = {},
			elixirls = {
				cmd = { "/opt/homebrew/bin/elixir-ls" },
				filetypes = { "elixir" },
			},
			fsautocomplete = { cmd = { "dotnet", "fsautocomplete" } },
			gleam = {},
			gopls = {},
			hls = {},
			intelephense = {},
			jdtls = {},
			kotlin_language_server = {},
			lua_ls = {},
			ocamllsp = {
				settings = {
					codelens = {
						enable = true,
						forNestedBindings = true,
					},
					inlayHints = {
						hintPatternVariables = true,
						hintLetBindings = true,
						hintFunctionParams = true,
					},
				},
			},
			omnisharp = {},
			ols = {},
			purescriptls = {},
			rescriptls = {},
			rust_analyzer = {},
			sourcekit = {
				capabilities = {
					textDocument = {
						semanticTokens = { dynamicRegistration = false },
					},
				},
			},
			tailwindcss = {},
			-- ts_ls = {},
			vtsls = {
				settings = {
					typescript = {
						inlayHints = {
							functionLikeReturnType = { enabled = true },
						},
					},
				},
			},
			zls = {},
		}

		require("lint").linters_by_ft = {
			go = { "staticcheck" },
		}

		vim.wo.signcolumn = "yes"
		vim.diagnostic.config({
			underline = true,
			virtual_text = true,
			virtual_lines = false,
			float = { border = "single" },
			severity_sort = true,
		})

		local codelens_filetypes = { ocaml = true, rescript = true }

		local function on_attach(client, bufnr)
			local buf_opts = { noremap = true, silent = true, buf = bufnr }

			require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)

			if client and client.server_capabilities and client.server_capabilities.semanticTokensProvider then
				client.server_capabilities.semanticTokensProvider = nil
			end

			if
				codelens_filetypes[vim.bo[bufnr].filetype]
				and client
				and client.server_capabilities
				and client.server_capabilities.codeLensProvider
			then
				vim.lsp.codelens.enable(true, { bufnr = bufnr })
				vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, buf_opts)
			end

			local map = vim.keymap.set
			map("n", "gd", vim.lsp.buf.definition, buf_opts)
			map("n", "H", function()
				vim.lsp.buf.hover({ border = "single" })
			end, buf_opts)
			map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, buf_opts)
			map("n", "K", vim.diagnostic.open_float, buf_opts)
			map("n", "[d", vim.diagnostic.goto_next, buf_opts)
			map("n", "]d", vim.diagnostic.goto_prev, buf_opts)
			map("n", "<leader>ca", vim.lsp.buf.code_action, buf_opts)
			map("n", "<leader>vrr", vim.lsp.buf.references, buf_opts)
			map("n", "<leader>vrn", vim.lsp.buf.rename, buf_opts)
			map("i", "<C-h>", vim.lsp.buf.signature_help, buf_opts)

			map("n", "<leader>vt", function()
				local cfg = vim.diagnostic.config()
				vim.diagnostic.config({ virtual_lines = false, virtual_text = not cfg.virtual_text })
			end, { desc = "Toggle [v]irtual [t]ext" })

			map("n", "<leader>ih", function()
				if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable and vim.lsp.inlay_hint.is_enabled then
					local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }) or false
					vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
				end
			end, { desc = "Toggle [i]nlay [h]ints", noremap = true, silent = true })

			map("n", "<leader>dl", function()
				local cfg = vim.diagnostic.config()
				vim.diagnostic.config({
					virtual_lines = not cfg.virtual_lines,
					virtual_text = not cfg.virtual_text,
				})
			end, { desc = "Toggle [d]iagnostic [l]ines" })
		end

		local blink_capabilities = blink.get_lsp_capabilities()
		local enable_list = {}

		for name, cfg in pairs(servers) do
			local user_cfg = cfg or {}
			local server_opts = vim.tbl_deep_extend("force", {
				on_attach = on_attach,
				capabilities = vim.tbl_deep_extend(
					"force",
					vim.lsp.protocol.make_client_capabilities(),
					blink_capabilities,
					user_cfg.capabilities or {}
				),
			}, user_cfg)

			local ok, err = pcall(vim.lsp.config, name, server_opts)
			if not ok then
				vim.notify(("vim.lsp.config failed for %s: %s"):format(name, tostring(err)), vim.log.levels.WARN)
			else
				table.insert(enable_list, name)
			end
		end

		if #enable_list > 0 then
			pcall(vim.lsp.enable, enable_list)
		end

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
				texthl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
					[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
					[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
				},
			},
		})
	end,
}
