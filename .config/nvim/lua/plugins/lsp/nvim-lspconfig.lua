return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	},
	opts = {
		servers = {
			basedpyright = {},
			biome = {},
			lua_ls = {},
			ocamllsp = {},
			rescriptls = {},
			rust_analyzer = {},
			zls = {},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		local blink = require("blink.cmp")
		require("lsp_lines").setup()

		local capabilities = blink.get_lsp_capabilities()
		local ensure_installed = vim.tbl_keys(opts.servers or {})
		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = " " },
			{ name = "DiagnosticSignHint", text = "󰌶 " },
			{ name = "DiagnosticSignInfo", text = " " },
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		vim.wo.signcolumn = "yes:1"
		vim.diagnostic.config({
			underline = true,
			virtual_text = true,
			virtual_lines = false,
			float = true,
		})

		require("mason").setup({})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = opts.servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					server.on_attach = function(client, bufnr)
						client.server_capabilities.semanticTokensProvider = nil

						local buf_opts = { buffer = bufnr, remap = false }

						vim.keymap.set("n", "gd", function()
							vim.lsp.buf.definition()
						end, buf_opts)
						vim.keymap.set("n", "H", function()
							vim.lsp.buf.hover()
						end, buf_opts)
						vim.keymap.set("n", "<leader>vws", function()
							vim.lsp.buf.workspace_symbol()
						end, buf_opts)
						vim.keymap.set("n", "K", function()
							vim.diagnostic.open_float()
						end, buf_opts)
						vim.keymap.set("n", "[d", function()
							vim.diagnostic.goto_next()
						end, buf_opts)
						vim.keymap.set("n", "]d", function()
							vim.diagnostic.goto_prev()
						end, buf_opts)
						vim.keymap.set("n", "<leader>ca", function()
							vim.lsp.buf.code_action()
						end, buf_opts)
						vim.keymap.set("n", "<leader>vrr", function()
							vim.lsp.buf.references()
						end, buf_opts)
						vim.keymap.set("n", "<leader>vrn", function()
							vim.lsp.buf.rename()
						end, buf_opts)
						vim.keymap.set("i", "<C-h>", function()
							vim.lsp.buf.signature_help()
						end, buf_opts)

						vim.keymap.set("n", "<leader>vt", function()
							local config = vim.diagnostic.config()
							vim.diagnostic.config({ virtual_lines = false, virtual_text = not config.virtual_text })
						end, { desc = "Toggle [v]irtual [t]ext" })

						vim.keymap.set("n", "<leader>dl", function()
							local config = vim.diagnostic.config()
							vim.diagnostic.config({
								virtual_lines = not config.virtual_lines,
								virtual_text = not config.virtual_text,
							})
						end, { desc = "Toggle [d]iagnostic [l]ines" })
					end

					lspconfig[server_name].setup(server)
				end,
			},
		})
	end,
}
