return {
	"moonbit-community/moonbit.nvim",
	ft = { "moonbit" },
	config = function()
		-- The built-in treesitter setup uses a deprecated API (require'nvim-treesitter'.install).
		-- Parser is already registered in plugins/util/treesitter.lua, so disable it here.
		local treesitter = require("moonbit.treesitter")
		local orig_setup = treesitter.setup
		treesitter.setup = function() end
		require("moonbit").setup({
			treesitter = {
				enabled = false,
			},
			lsp = {
				on_attach = function(client, bufnr)
					local buf_opts = { noremap = true, silent = true, buf = bufnr }

					if client.server_capabilities.semanticTokensProvider then
						client.server_capabilities.semanticTokensProvider = nil
					end

					if client.server_capabilities.codeLensProvider then
						vim.lsp.codelens.enable(true, { bufnr = bufnr })
						vim.keymap.set("n", "<leader>cl", function()
							vim.lsp.codelens.run()
						end, buf_opts)
					end

					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
					end, buf_opts)
					vim.keymap.set("n", "H", function()
						vim.lsp.buf.hover({
							border = "single",
						})
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

					vim.keymap.set("n", "<leader>ih", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, { desc = "Toggle [i]nlay [h]ints" })

					vim.keymap.set("n", "<leader>dl", function()
						local config = vim.diagnostic.config()
						vim.diagnostic.config({
							virtual_lines = not config.virtual_lines,
							virtual_text = not config.virtual_text,
						})
					end, { desc = "Toggle [d]iagnostic [l]ines" })
				end,
				capabilities = vim.lsp.protocol.make_client_capabilities(),
			},
		})
		treesitter.setup = orig_setup
	end,
}
