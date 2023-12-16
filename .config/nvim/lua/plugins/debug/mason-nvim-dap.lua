return {
	"jay-babu/mason-nvim-dap.nvim",
	lazy = true,
	keys = "F5",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require("mason").setup()
		require("mason-nvim-dap").setup({
			ensure_installed = { "js-debug-adapter", "node-debug2-adapter" },
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
				node2 = function(config)
					config.adapters = {
						-- For this to work you need to make sure the node process is started with the `--inspect` flag.
						name = "Debug: Attach to process",
						type = "executable",
						command = vim.fn.exepath("node-debug2-adapter"),
						request = "attach",
						processId = require("dap.utils").pick_process
					}

					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})
	end,
}
