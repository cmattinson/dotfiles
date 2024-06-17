return {
	"VonHeikemen/lsp-zero.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-buffer",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		local lsp_zero = require("lsp-zero").preset({
			name = "recommended",
			call_servers = "local",
			setup_servers_on_start = true,
			manage_nvim_cmp = {
				set_sources = "recommended",
				set_basic_mappings = false,
				set_extra_mappings = false,
				use_luasnip = true,
				set_format = true,
				documentation_window = true,
			},
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		lsp_zero.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "H", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "K", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, opts)
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, opts)
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
		end)

		vim.diagnostic.config({
			underline = true,
			virtual_text = true,
			float = true,
		})

		lsp_zero.set_sign_icons({
			error = "",
			warn = "",
			hint = "󰌶",
			info = "",
		})

		local servers = {
			gopls = {},
			rust_analyzer = {},
			ocamllsp = {},
			biome = {},
			zls = {},
			lua_ls = {},
		}

		local ensure_installed = vim.tbl_keys(servers or {})

		require("mason").setup({})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
		require("lspconfig").gleam.setup({})

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer" },
				{ name = "vim-dadbod-completion" },
			},
			formatting = lsp_zero.cmp_format(),
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
		})
	end,
}
