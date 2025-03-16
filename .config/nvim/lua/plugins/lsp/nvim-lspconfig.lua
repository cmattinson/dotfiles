return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local blink = require("blink.cmp")
		require("lsp_lines").setup()

		local servers = {
			basedpyright = {},
			biome = {},
			cssls = {},
			gleam = {},
			intelephense = {},
			kotlin_language_server = {},
			lua_ls = {},
			ocamllsp = {},
			ols = {},
			rescriptls = {},
			rust_analyzer = {},
			sourcekit = {},
			ts_ls = {},
			zls = {},
		}

		vim.wo.signcolumn = "yes:1"
		vim.diagnostic.config({
			underline = true,
			virtual_text = true,
			virtual_lines = false,
			float = true,
			severity_sort = true,
		})

		local on_attach = function(client, bufnr)
			local buf_opts = { noremap = true, silent = true, buffer = bufnr }
			client.server_capabilities.semanticTokensProvider = nil

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

		local blink_capabilities = blink.get_lsp_capabilities()
		for lsp, config in pairs(servers) do
			local server = config or {}
			server.on_attach = on_attach
			server.capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				blink_capabilities,
				config.capabilities or {}
			)
			server.capabilities.semanticTokensProvider = nil

			lspconfig[lsp].setup(server)
		end

		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = " " },
			{ name = "DiagnosticSignHint", text = "󰌶 " },
			{ name = "DiagnosticSignInfo", text = " " },
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end
	end,
}
